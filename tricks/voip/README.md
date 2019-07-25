---
id: voip-intro
title: VoIP
---

# VoIP

## Tips
* https://www.linphone.org/

## RFCs
* [Voice-Related RFCs](https://www.cisco.com/c/en/us/support/docs/voice/voice-quality/46275-voice-rfcs.html)
* RFC 3856 - A Presence Event Package for the Session Initiation Protocol
* RFC 3262 Reliability of Provisional Responses in the Session Initiation Protocol
  * 临时响应的可靠传输
  * [RFC4028的不足与SIP KEEP-ALIVE方法](https://www.myvoipapp.com/blogs/yxh/2011/10/30/rfc4028%E7%9A%84%E4%B8%8D%E8%B6%B3%E4%B8%8Esip-keep-alive%E6%96%B9%E6%B3%95/)
* RFC 4028 - Session Timers in the Session Initiation Protocol
  * 会话刷新
* RFC 3261 SIP: Session Initiation Protocol
  * https://tools.ietf.org/html/rfc3261
  * 定义了使用 OPTIONS 来检测状态
    * asterisk 中的 qualify
* RFC 2833 - RTP Payload for DTMF Digits, Telephony Tones and Telephony Signals
  * https://tools.ietf.org/html/rfc2833
* RFC 4733 - RTP Payload for DTMF Digits, Telephony Tones, and Telephony Signals
  * 替代 RFC 2833
  * https://tools.ietf.org/html/rfc4733
* RFC 6913 - Indicating Fax over IP Capability in the Session Initiation Protocol (SIP)
  * https://tools.ietf.org/html/rfc6913


## FAQ
### What is overlap dialing ?
* [What is overlap dialing ?](https://www.3cx.com/blog/voip-howto/overlap-dialing/)

影响按键之间的超时间隔, 关闭后, 网关会一个数字一个数字的接收, 开启后, 网关会有一定的等待延时, 例如 2s.

主要用于在拨号时处理歧义, 例如 `23163441`, 在接收到一部分的时候, 可能就已经开始拨号, 这是不对的, 应该等待输入完成




