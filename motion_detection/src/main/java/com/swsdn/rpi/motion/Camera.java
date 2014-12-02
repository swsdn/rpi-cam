package com.swsdn.rpi.motion;

import com.swsdn.rpi.motion.model.Picture;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;

/**
 * Created by Krzysiek on 2014-12-02.
 */
public class Camera {

    private static final Logger LOG = LoggerFactory.getLogger(Camera.class );
    private final String raspistill = "/opt/vc/bin/raspistill -rot 180 --nopreview --timeout 1 --quality 8 --thumb none --exposure auto --output ~/photos/java-photo.jpg";

    public Picture takePicture() {
        try {
            Runtime.getRuntime().exec(raspistill);
            return new Picture();
        } catch (IOException e) {
            LOG.error("Can't take picture.", e);
            throw new RuntimeException(e);
        }
    }

    public static void main(String[] args) {
        Camera camera = new Camera();
        camera.takePicture();
    }
}

