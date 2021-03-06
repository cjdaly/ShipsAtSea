####
# Copyright (c) 2014 Chris J Daly (github user cjdaly)
# All rights reserved. This program and the accompanying materials
# are made available under the terms of the Eclipse Public License v1.0
# which accompanies this distribution, and is available at
# http://www.eclipse.org/legal/epl-v10.html
#
# Contributors:
#   cjdaly - initial API and implementation
####

module Napkin::Plugins
  class Xadow < PluginBase
    DEVICE_ID = "SaS_Xadow"
    CHATTER_KEY_PREFIXES = [
      "vitals.",
      "sensor.barometer."
    ]

    def init
      register_task('xadow_sensor_data', SensorData_Task)
    end

    class SensorData_Task < Napkin::Tasks::ActiveTaskBase
      include Napkin::Util::Client
      def init
        @sensor_uart = File.open("/dev/ttyS1", "r")
        @sensor_data = {}
        increment_start_count(DEVICE_ID)
      end

      def fini
        @sensor_uart.close
      end

      def cycle
        process_sensor_data(@sensor_uart, @sensor_data, DEVICE_ID, CHATTER_KEY_PREFIXES)
      end

    end
  end
end

