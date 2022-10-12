Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7497F5FD913
	for <lists+cluster-devel@lfdr.de>; Thu, 13 Oct 2022 14:17:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665663451;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=Y3t3T5A0CNZfHnuiirguZVaaAi/cfmdOzs9XC2Yc3ro=;
	b=RUJ9IDfjr9VypcXHbVO7IK3uS9IWAWNtf25V30cLfR3sGUspd/9lljKKpnMHmKxYUlN3MA
	dXs/4aO0qeqBmjBTVfqlz11Cu5ehwe2YsnBmGu0jMINsMW5+Jei1HtNvceG80fdPDlsvaW
	D2DKaMoxHQF4WEyNWlOYX4Wd8+sCkNU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-56-ZcejJy30Nsq3XBmTNSz23Q-1; Thu, 13 Oct 2022 08:17:28 -0400
X-MC-Unique: ZcejJy30Nsq3XBmTNSz23Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2A60885A59D;
	Thu, 13 Oct 2022 12:17:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CEBB0208BDC1;
	Thu, 13 Oct 2022 12:17:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6768519465A2;
	Thu, 13 Oct 2022 12:17:24 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3D2A01946588 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 12 Oct 2022 17:43:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 051012166B38; Wed, 12 Oct 2022 17:43:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F22532166B35
 for <cluster-devel@redhat.com>; Wed, 12 Oct 2022 17:43:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D29281C05122
 for <cluster-devel@redhat.com>; Wed, 12 Oct 2022 17:43:54 +0000 (UTC)
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-643-JhCs5H5iPuqjKfRL88Fr6g-1; Wed, 12 Oct 2022 13:43:52 -0400
X-MC-Unique: JhCs5H5iPuqjKfRL88Fr6g-1
Received: by mail-il1-f198.google.com with SMTP id
 i21-20020a056e021d1500b002f9e4f8eab7so13767369ila.7
 for <cluster-devel@redhat.com>; Wed, 12 Oct 2022 10:43:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y3t3T5A0CNZfHnuiirguZVaaAi/cfmdOzs9XC2Yc3ro=;
 b=J6G6o8RhIGOmC964sZdjA/AZ1CA3YV5+na1QdcAHpBb/Q6l43n0RnBfaPw8H/EQzg1
 44H0I+uxJNmqztZltst+OvOe/C1Jxct2pbaLXIhX/YGJa2tzHYQ+aF+eMW2EuaBYbx5k
 mjlGWrTOgQTpk97lpoQP+SRZn0xIMmtKMJDfHYmpl15n4ddzUQn53oiZvnv8+5F0eQnQ
 ZObWuPGwRtD2jBrO7P4q4M290VvPAC8VbXYkNM8ylhn74tHRj2q4/mU9EaJys9Fan3XX
 XNIjN1za0rV3CI465xk22z7lXyZw0hU4XXNMNd+LsWDMdptajyD34saVJ5hEg1HT0X28
 bpPg==
X-Gm-Message-State: ACrzQf1qN0NQ33nARi0Pjl0bUCJkSzpBjMr5yNaB+PA+xS0hbt0zJv4d
 aFrJ22Zktsiy2pON143QPUr4wASJr/aBhEWtj7MSxCrIVuBo
X-Google-Smtp-Source: AMsMyM42dMQOvWy91GEOPI1bnLiv5In7DR/xVs1GynbAy2Ai0ChovX2pHuLl6cHz/s/kmW85hU6mIifP+bAdkMCL5r1J/W2I+CwR
MIME-Version: 1.0
X-Received: by 2002:a05:6602:2c8e:b0:6a3:886a:30fb with SMTP id
 i14-20020a0566022c8e00b006a3886a30fbmr14692434iow.75.1665596632018; Wed, 12
 Oct 2022 10:43:52 -0700 (PDT)
Date: Wed, 12 Oct 2022 10:43:52 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000097399505ead9ef34@google.com>
From: syzbot <syzbot+31cde0bef4bbf8ba2d86@syzkaller.appspotmail.com>
To: aahringo@redhat.com, ccaulfie@redhat.com, cluster-devel@redhat.com, 
 davem@davemloft.net, dev@openvswitch.org, edumazet@google.com, 
 kuba@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 pabeni@redhat.com, pshelar@ovn.org, syzkaller-bugs@googlegroups.com, 
 teigland@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mailman-Approved-At: Thu, 13 Oct 2022 12:17:23 +0000
Subject: [Cluster-devel] [syzbot] WARNING in ovs_dp_reset_user_features
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    e8bc52cb8df8 Merge tag 'driver-core-6.1-rc1' of git://git...
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=134de042880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7579993da6496f03
dashboard link: https://syzkaller.appspot.com/bug?extid=31cde0bef4bbf8ba2d86
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12173a34880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1792461a880000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/4dc25a89bfbd/disk-e8bc52cb.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/16c9ca5fd754/vmlinux-e8bc52cb.xz

The issue was bisected to:

commit 6b0afc0cc3e9a9a91f5a76d0965d449781441e18
Author: Alexander Aring <aahringo@redhat.com>
Date:   Wed Jun 22 18:45:23 2022 +0000

    fs: dlm: don't use deprecated timeout features by default

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=10d5787c880000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=12d5787c880000
console output: https://syzkaller.appspot.com/x/log.txt?x=14d5787c880000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+31cde0bef4bbf8ba2d86@syzkaller.appspotmail.com
Fixes: 6b0afc0cc3e9 ("fs: dlm: don't use deprecated timeout features by default")

------------[ cut here ]------------
Dropping previously announced user features
WARNING: CPU: 1 PID: 3608 at net/openvswitch/datapath.c:1619 ovs_dp_reset_user_features+0x1bc/0x240 net/openvswitch/datapath.c:1619
Modules linked in:
CPU: 1 PID: 3608 Comm: syz-executor162 Not tainted 6.0.0-syzkaller-07994-ge8bc52cb8df8 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/22/2022
RIP: 0010:ovs_dp_reset_user_features+0x1bc/0x240 net/openvswitch/datapath.c:1619
Code: 00 c7 03 00 00 00 00 eb 05 e8 d0 be 67 f7 5b 41 5c 41 5e 41 5f 5d c3 e8 c2 be 67 f7 48 c7 c7 00 92 e3 8b 31 c0 e8 74 7a 2f f7 <0f> 0b eb c7 44 89 f1 80 e1 07 fe c1 38 c1 0f 8c f1 fe ff ff 4c 89
RSP: 0018:ffffc90003b8f370 EFLAGS: 00010246
RAX: e794c0e413340e00 RBX: ffff8880175cae68 RCX: ffff88801c069d80
RDX: 0000000000000000 RSI: 0000000080000000 RDI: 0000000000000000
RBP: 0000000000000008 R08: ffffffff816c58ad R09: ffffed1017364f13
R10: ffffed1017364f13 R11: 1ffff11017364f12 R12: dffffc0000000000
R13: ffff8880175ca450 R14: 1ffff11002eb95cd R15: ffffc90003b8f6b0
FS:  0000555557276300(0000) GS:ffff8880b9b00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000020000916 CR3: 000000001ed81000 CR4: 00000000003506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 ovs_dp_cmd_new+0x8f6/0xc80 net/openvswitch/datapath.c:1822
 genl_family_rcv_msg_doit net/netlink/genetlink.c:731 [inline]
 genl_family_rcv_msg net/netlink/genetlink.c:808 [inline]
 genl_rcv_msg+0x11ca/0x1670 net/netlink/genetlink.c:825
 netlink_rcv_skb+0x1f0/0x460 net/netlink/af_netlink.c:2540
 genl_rcv+0x24/0x40 net/netlink/genetlink.c:836
 netlink_unicast_kernel net/netlink/af_netlink.c:1319 [inline]
 netlink_unicast+0x7e7/0x9c0 net/netlink/af_netlink.c:1345
 netlink_sendmsg+0x9b3/0xcd0 net/netlink/af_netlink.c:1921
 sock_sendmsg_nosec net/socket.c:714 [inline]
 sock_sendmsg net/socket.c:734 [inline]
 ____sys_sendmsg+0x597/0x8e0 net/socket.c:2482
 ___sys_sendmsg net/socket.c:2536 [inline]
 __sys_sendmsg+0x28e/0x390 net/socket.c:2565
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x2b/0x70 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7fc51f29de89
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 b1 14 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 c0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffd99ec6ed8 EFLAGS: 00000246 ORIG_RAX: 000000000000002e
RAX: ffffffffffffffda RBX: 000000000000a2c4 RCX: 00007fc51f29de89
RDX: 0000000000000000 RSI: 0000000020000100 RDI: 0000000000000003
RBP: 0000000000000000 R08: 00007ffd99ec7078 R09: 00007ffd99ec7078
R10: 00007ffd99ec6950 R11: 0000000000000246 R12: 00007ffd99ec6eec
R13: 431bde82d7b634db R14: 0000000000000000 R15: 0000000000000000
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches

