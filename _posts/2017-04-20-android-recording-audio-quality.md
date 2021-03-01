---
layout: post
title: "Android recording audio quality"
date: "2017-04-20 00:17:05 -0300"
tags: [android, audio, free-software, multimedia]
---

Roughly sorted by quality:

    amr_nb in 3gpp < amr_wb in 3gpp < aac_lc in m4a < aac+ in m4a (only in Android 4.0+) < opus in webm (only in android 5+) < pcm in wav (only in android 4.1+)

Taking into consideration the compatibility of the codecs (mainly with
Android and with the popular WhatsApp and Telegram messengers), the best
options seem to be:

    aac_lc in m4a < aac+ in m4a (API >= 16) < vorbis/opus in webm (API >= 21) < pcm in wav (only in android 4.1+)


For a device running API 14, we can use something like this
(`MediaRecorder.OutputFormat` constants):

* For very low quality/very low bitrate/very long recording times, use
  AMR-NB in 3GPP container.  Parameters summary: 8kHz and bitrate 12.8kbps
  Works pretty much anywhere.

* For low quality/low bitrate/long recording times, use AAC in MP4
  container, with ***m4a*** extension. Works pretty much anywhere. Example
  code adapted from:
  https://developer.android.com/guide/topics/media/mediarecorder.html


        private void startRecording() {
           mRecorder = new MediaRecorder();
           mRecorder.setAudioSource(MediaRecorder.AudioSource.MIC);
           mRecorder.setOutputFormat(MediaRecorder.OutputFormat.MPEG_4); // other?
           mRecorder.setOutputFile(mFileName); // end in m4a, for compatibility
           mRecorder.setAudioEncoder(MediaRecorder.AudioEncoder.AAC); // AAC_HE, if supported

           try {
               mRecorder.prepare();
           } catch (IOException e) {
               Log.e(LOG_TAG, "prepare() failed");
           }

           mRecorder.start();
        }

