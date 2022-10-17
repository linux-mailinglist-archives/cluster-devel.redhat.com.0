Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 413B3601085
	for <lists+cluster-devel@lfdr.de>; Mon, 17 Oct 2022 15:52:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666014750;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=lqQXsOI5okwp7tHsWsepN69Tg9z/q36luKs+gX9rv8Q=;
	b=RCuvJGhMTxUgK8kBXTY1d5li4/LANkvMdCJFlQ3O5svuBxFySZ0xSVlznhL7Air3IGuhK4
	P1nfds54n9CYMv38EvtNyWunrserY+JxX0o879a5dpOliBx3zcMHflFih++N8hXVIH5nQq
	TK7JVWOvU/T93NZ0WZccBGUMOozGy2c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-cQPob_9wPMOjyy93wNuUaA-1; Mon, 17 Oct 2022 09:52:27 -0400
X-MC-Unique: cQPob_9wPMOjyy93wNuUaA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 195FF100F7FE;
	Mon, 17 Oct 2022 13:52:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DBCE3C5695E;
	Mon, 17 Oct 2022 13:52:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B68EC19465A0;
	Mon, 17 Oct 2022 13:52:19 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8F9B5194658F for <cluster-devel@listman.corp.redhat.com>;
 Mon, 17 Oct 2022 13:26:11 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DEEBAC16922; Mon, 17 Oct 2022 13:26:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from RHTPC1VM0NT (unknown [10.22.33.157])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 68714C15BA5;
 Mon, 17 Oct 2022 13:26:06 +0000 (UTC)
From: Aaron Conole <aconole@redhat.com>
To: Paolo Abeni <pabeni@redhat.com>
References: <00000000000097399505ead9ef34@google.com>
 <c7dd8b101d78c27e1f21ab15f98627e5a5fd919e.camel@redhat.com>
Date: Mon, 17 Oct 2022 09:26:05 -0400
In-Reply-To: <c7dd8b101d78c27e1f21ab15f98627e5a5fd919e.camel@redhat.com>
 (Paolo Abeni's message of "Thu, 13 Oct 2022 10:12:50 +0200")
Message-ID: <f7th702d1jm.fsf@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mailman-Approved-At: Mon, 17 Oct 2022 13:52:19 +0000
Subject: Re: [Cluster-devel] [ovs-dev] [syzbot] WARNING in
 ovs_dp_reset_user_features
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
Cc: dev@openvswitch.org, netdev@vger.kernel.org,
 syzkaller-bugs@googlegroups.com, edumazet@google.com,
 linux-kernel@vger.kernel.org, cluster-devel@redhat.com, kuba@kernel.org,
 pshelar@ovn.org, davem@davemloft.net,
 syzbot <syzbot+31cde0bef4bbf8ba2d86@syzkaller.appspotmail.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Paolo Abeni <pabeni@redhat.com> writes:

> On Wed, 2022-10-12 at 10:43 -0700, syzbot wrote:
>> Hello,
>> 
>> syzbot found the following issue on:
>> 
>> HEAD commit:    e8bc52cb8df8 Merge tag 'driver-core-6.1-rc1' of git://git...
>> git tree:       upstream
>> console+strace: https://syzkaller.appspot.com/x/log.txt?x=134de042880000
>> kernel config:  https://syzkaller.appspot.com/x/.config?x=7579993da6496f03
>> dashboard link: https://syzkaller.appspot.com/bug?extid=31cde0bef4bbf8ba2d86
>> compiler: Debian clang version
>> 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU
>> ld (GNU Binutils for Debian) 2.35.2
>> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12173a34880000
>> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1792461a880000
>> 
>> Downloadable assets:
>> disk image: https://storage.googleapis.com/syzbot-assets/4dc25a89bfbd/disk-e8bc52cb.raw.xz
>> vmlinux: https://storage.googleapis.com/syzbot-assets/16c9ca5fd754/vmlinux-e8bc52cb.xz
>> 
>> The issue was bisected to:
>> 
>> commit 6b0afc0cc3e9a9a91f5a76d0965d449781441e18
>> Author: Alexander Aring <aahringo@redhat.com>
>> Date:   Wed Jun 22 18:45:23 2022 +0000
>> 
>>     fs: dlm: don't use deprecated timeout features by default
>
> This commit is not really relevant for the issue, but it makes the
> reproducer fail, since it changes the genl_family registration order
> and the repro hard-codes the ovs genl family id.

I have an easy reproducer at:

http://git.bytheb.org/cgit/kselftest.git/commit/?id=97800e452e2cea1fafb45058120128e902d8970e

(PS: I do plan to do some cleanup and then post this kselftest stuff)

>> 
>> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=10d5787c880000
>> final oops:     https://syzkaller.appspot.com/x/report.txt?x=12d5787c880000
>> console output: https://syzkaller.appspot.com/x/log.txt?x=14d5787c880000
>> 
>> IMPORTANT: if you fix the issue, please add the following tag to the commit:
>> Reported-by: syzbot+31cde0bef4bbf8ba2d86@syzkaller.appspotmail.com
>> Fixes: 6b0afc0cc3e9 ("fs: dlm: don't use deprecated timeout features by default")
>> 
>> ------------[ cut here ]------------
>> Dropping previously announced user features
>> WARNING: CPU: 1 PID: 3608 at net/openvswitch/datapath.c:1619
>> ovs_dp_reset_user_features+0x1bc/0x240
>> net/openvswitch/datapath.c:1619
>> Modules linked in:
>> CPU: 1 PID: 3608 Comm: syz-executor162 Not tainted 6.0.0-syzkaller-07994-ge8bc52cb8df8 #0
>> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/22/2022
>> RIP: 0010:ovs_dp_reset_user_features+0x1bc/0x240 net/openvswitch/datapath.c:1619
>> Code: 00 c7 03 00 00 00 00 eb 05 e8 d0 be 67 f7 5b 41 5c 41 5e 41 5f
>> 5d c3 e8 c2 be 67 f7 48 c7 c7 00 92 e3 8b 31 c0 e8 74 7a 2f f7 <0f>
>> 0b eb c7 44 89 f1 80 e1 07 fe c1 38 c1 0f 8c f1 fe ff ff 4c 89
>> RSP: 0018:ffffc90003b8f370 EFLAGS: 00010246
>> RAX: e794c0e413340e00 RBX: ffff8880175cae68 RCX: ffff88801c069d80
>> RDX: 0000000000000000 RSI: 0000000080000000 RDI: 0000000000000000
>> RBP: 0000000000000008 R08: ffffffff816c58ad R09: ffffed1017364f13
>> R10: ffffed1017364f13 R11: 1ffff11017364f12 R12: dffffc0000000000
>> R13: ffff8880175ca450 R14: 1ffff11002eb95cd R15: ffffc90003b8f6b0
>> FS:  0000555557276300(0000) GS:ffff8880b9b00000(0000) knlGS:0000000000000000
>> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> CR2: 0000000020000916 CR3: 000000001ed81000 CR4: 00000000003506e0
>> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>> Call Trace:
>>  <TASK>
>>  ovs_dp_cmd_new+0x8f6/0xc80 net/openvswitch/datapath.c:1822
>>  genl_family_rcv_msg_doit net/netlink/genetlink.c:731 [inline]
>>  genl_family_rcv_msg net/netlink/genetlink.c:808 [inline]
>>  genl_rcv_msg+0x11ca/0x1670 net/netlink/genetlink.c:825
>>  netlink_rcv_skb+0x1f0/0x460 net/netlink/af_netlink.c:2540
>>  genl_rcv+0x24/0x40 net/netlink/genetlink.c:836
>>  netlink_unicast_kernel net/netlink/af_netlink.c:1319 [inline]
>>  netlink_unicast+0x7e7/0x9c0 net/netlink/af_netlink.c:1345
>>  netlink_sendmsg+0x9b3/0xcd0 net/netlink/af_netlink.c:1921
>>  sock_sendmsg_nosec net/socket.c:714 [inline]
>>  sock_sendmsg net/socket.c:734 [inline]
>>  ____sys_sendmsg+0x597/0x8e0 net/socket.c:2482
>>  ___sys_sendmsg net/socket.c:2536 [inline]
>>  __sys_sendmsg+0x28e/0x390 net/socket.c:2565
>>  do_syscall_x64 arch/x86/entry/common.c:50 [inline]
>>  do_syscall_64+0x2b/0x70 arch/x86/entry/common.c:80
>>  entry_SYSCALL_64_after_hwframe+0x63/0xcd
>> RIP: 0033:0x7fc51f29de89
>> Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 b1 14 00 00 90 48 89 f8 48
>> 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48>
>> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 c0 ff ff ff f7 d8 64 89 01 48
>> RSP: 002b:00007ffd99ec6ed8 EFLAGS: 00000246 ORIG_RAX: 000000000000002e
>> RAX: ffffffffffffffda RBX: 000000000000a2c4 RCX: 00007fc51f29de89
>> RDX: 0000000000000000 RSI: 0000000020000100 RDI: 0000000000000003
>> RBP: 0000000000000000 R08: 00007ffd99ec7078 R09: 00007ffd99ec7078
>> R10: 00007ffd99ec6950 R11: 0000000000000246 R12: 00007ffd99ec6eec
>> R13: 431bde82d7b634db R14: 0000000000000000 R15: 0000000000000000
>>  </TASK>
>> 
> In this specific case it looks like the warning is caused by the fact
> that ovs allows an 'outdated' datapath to set user_features (version is
> not checked in ovs_dp_change()) but later complains if the same user-
> space touch again the same datapath (version check in
> ovs_dp_reset_user_features())

Maybe this should be changed from WARN() to printk(KERN_NOTICE, ..) or
something similar?  It can indicate an error condition that will make
the upcall interface unreachable, so I think we should alert the user.

> /P
>
> _______________________________________________
> dev mailing list
> dev@openvswitch.org
> https://mail.openvswitch.org/mailman/listinfo/ovs-dev

