require 'shellwords'

module Simple
  module Spawn
    extend self

    def spawn cmd
      commands = pipeify(cmd)

      tmp_in, tmp_out, pipe = $stdin, $stdout, []

      commands.each_with_index do |cmd, index|
        program, *args = Shellwords.shellsplit(cmd)

        if index+1 < commands.size
          pipe = IO.pipe
          tmp_out = pipe.last
        else
          tmp_out = $stdout
        end

        Spawner.new(program, *args, tmp_out, tmp_in).exec!

        tmp_out.close unless tmp_out == $stdout
        tmp_in.close unless tmp_in == $stdin
        tmp_in = pipe.first
      end

      Process.waitall
    end

    def pipeify(line)
      line.scan( /([^"'|]+)|["']([^"']+)["']/ ).flatten.compact
    end

    class Spawner

      attr_reader :program, :args, :tmp_out, :tmp_in

      def initialize program, *args, tmp_out, tmp_in
        @tmp_out = tmp_out
        @tmp_in  = tmp_in
        @program = program
        @args    = *args
      end

      def exec!
        fork {
          close_out unless tmp_out == $stdout
          close_in  unless tmp_in == $stdin
          exec program, *args
        }
      end

      private

      def close_out
        $stdout.reopen(tmp_out)
        tmp_out.close
      end
      def close_in
        $stdin.reopen(tmp_in)
        tmp_in.close
      end
    end
  end
end
