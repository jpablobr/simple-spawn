require 'shellwords'

module Simple
  module Spawn
    extend self

    def spawn cmd
      commands = pipeify(cmd)

      tmp_in = $stdin
      tmp_out = $stdout
      pipe = []

      commands.each_with_index do |command, index|
        program, *args = Shellwords.shellsplit(command)

        if index+1 < commands.size
          pipe = IO.pipe
          tmp_out = pipe.last
        else
          tmp_out = $stdout
        end

        spawn_program(program, *args, tmp_out, tmp_in)

        tmp_out.close unless tmp_out == $stdout
        tmp_in.close unless tmp_in == $stdin
        tmp_in = pipe.first
      end

      Process.waitall
    end

    def pipeify(line)
      line.scan( /([^"'|]+)|["']([^"']+)["']/ ).flatten.compact
    end

    def spawn_program(program, *args, tmp_out, tmp_in)
      fork {
        unless tmp_out == $stdout
          $stdout.reopen(tmp_out)
          tmp_out.close
        end

        unless tmp_in == $stdin
          $stdin.reopen(tmp_in)
          tmp_in.close
        end

        exec program, *args
      }
    end
  end
end
