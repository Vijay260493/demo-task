package com.xnara.apphealth.instance;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.Clock;
import java.util.UUID;

@RestController
public class InstanceIdController {

    private static final String INSTANCE_ID = UUID.randomUUID().toString();

    public static class InstanceId {
        String instanceId = INSTANCE_ID;
        String status = "UP";

        public InstanceId() {
        }

        public String getInstanceId() {
            return instanceId;
        }

        public String getStatus() {
            return status;
        }

        public Long getTimestamp() {
            return Clock.systemUTC().millis();
        }
    }

    @GetMapping("/info")
    public InstanceId getId() {
        return new InstanceId();
    }
}
