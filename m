Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE1F5BE50A
	for <lists+cluster-devel@lfdr.de>; Tue, 20 Sep 2022 13:57:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663675062;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3MuZ9lS5ghRfFo2i6mIb6NriDGfSjO9gHz3Coh3u8Hw=;
	b=K5SuaVF/Pf6c8yMRX1Ji7hgVSJQ2fZjI3eg1e7RVCHaIO8YnnEyo/OETw9sUJEJ8fVG65T
	q6Q4oSciVzJ8H+54CVb+qOM7NHCEcRt4+BP0OpYKNUsW+8EKtgaV2NgZ36Zp7P4L/E41W7
	kHQz+FeoVp1wyfpME1MVBwQaeWyzfSY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-brtI2vzjMySoWnyRGl4eQA-1; Tue, 20 Sep 2022 07:57:39 -0400
X-MC-Unique: brtI2vzjMySoWnyRGl4eQA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2BCE1857F92;
	Tue, 20 Sep 2022 11:57:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D073B1415139;
	Tue, 20 Sep 2022 11:57:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BE08219465A8;
	Tue, 20 Sep 2022 11:57:36 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 456CD1946586 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 15 Sep 2022 15:40:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 33797C15BA5; Thu, 15 Sep 2022 15:40:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F939C15BA4
 for <cluster-devel@redhat.com>; Thu, 15 Sep 2022 15:40:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1769B830F9F
 for <cluster-devel@redhat.com>; Thu, 15 Sep 2022 15:40:42 +0000 (UTC)
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-266-J33NSND9M2ySIry5Zq46ZA-1; Thu, 15 Sep 2022 11:40:40 -0400
X-MC-Unique: J33NSND9M2ySIry5Zq46ZA-1
Received: by mail-io1-f72.google.com with SMTP id
 s2-20020a6bdc02000000b006a0cb10e1e8so10246587ioc.14
 for <cluster-devel@redhat.com>; Thu, 15 Sep 2022 08:40:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date;
 bh=3MuZ9lS5ghRfFo2i6mIb6NriDGfSjO9gHz3Coh3u8Hw=;
 b=UmiY61RptQ1sBlTuYv5cj3yk8uxmRpiwseM4nJKdHHf9E42M6+7Q9OztXOyK30otPa
 Rrtay+WqWdb5J+Db5dXBkvseEzcOTH95VV/hReSFFYgPp62UkWEEJoFPXIVkFRwpM6UW
 mkGqXOwU1ROfeZiG87WQwe5vgTTrKgLqU0ZILu1Gu8VCvq4sVrTObMlJ9FxyqXIw4CfU
 C5/07ILLMJgMW2PrVsfYzBZURVd1xvFsCxukeQPg/qpDGvGx+Ol1T1cbPh1M3/C0gmvx
 90VRPs/FzP2MDq+ft5cSGBwwDPjC4jH58dczt7M2Tu/80NHQ/mrFW94q6KG5zWjoFcRD
 9Yhw==
X-Gm-Message-State: ACrzQf3nuBfP5ib4Zx6S481rmYg0g34men2u1H65jR7LuusDeHJG5x8q
 wmCCLuY8l6tKwFAOxYWCtQ/WqEo7SUnuFbpl9ynWaF4Jg/SL
X-Google-Smtp-Source: AMsMyM4weKJfciG4eOcaTRSDy1TEeHhwarRWmmNR8Yfq8MO4MQrjUNT0XcTsTPJVg0D+KIF7C/+3SyxT1ls5b6yQ9+DzM+MoOK67
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:12ea:b0:2f0:6de5:50b0 with SMTP id
 l10-20020a056e0212ea00b002f06de550b0mr271940iln.276.1663256439738; Thu, 15
 Sep 2022 08:40:39 -0700 (PDT)
Date: Thu, 15 Sep 2022 08:40:39 -0700
In-Reply-To: <000000000000c371f705e6259a38@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000042dafa05e8b911a6@google.com>
From: syzbot <syzbot+dcf33a7aae997956fe06@syzkaller.appspotmail.com>
To: agruenba@redhat.com, anprice@redhat.com, cluster-devel@redhat.com, 
 fgheet255t@gmail.com, linux-kernel@vger.kernel.org, rpeterso@redhat.com, 
 syzkaller-bugs@googlegroups.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mailman-Approved-At: Tue, 20 Sep 2022 11:57:35 +0000
Subject: Re: [Cluster-devel] [syzbot] UBSAN: shift-out-of-bounds in init_sb
 (3)
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    e47eb90a0a9a Add linux-next specific files for 20220901
git tree:       linux-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=14c90dbf080000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7933882276523081
dashboard link: https://syzkaller.appspot.com/bug?extid=dcf33a7aae997956fe06
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=179ef880880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17047887080000

Downloadable assets:
disk image: https://storage.googleapis.com/d3bf639370bc/disk-e47eb90a.raw.xz
vmlinux: https://storage.googleapis.com/1c9c27c6eeef/vmlinux-e47eb90a.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+dcf33a7aae997956fe06@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 256
gfs2: fsid=loop0: Trying to join cluster "lock_nolock", "loop0"
gfs2: fsid=loop0: Now mounting FS (format 1801)...
================================================================================
UBSAN: shift-out-of-bounds in fs/gfs2/ops_fstype.c:295:19
shift exponent 327683 is too large for 64-bit type 'long unsigned int'
CPU: 0 PID: 3611 Comm: syz-executor306 Not tainted 6.0.0-rc3-next-20220901-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/26/2022
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:106
 ubsan_epilogue+0xb/0x50 lib/ubsan.c:151
 __ubsan_handle_shift_out_of_bounds.cold+0xb1/0x187 lib/ubsan.c:322
 gfs2_read_sb fs/gfs2/ops_fstype.c:295 [inline]
 init_sb.cold+0x19/0x109 fs/gfs2/ops_fstype.c:487
 gfs2_fill_super+0x17fe/0x27a0 fs/gfs2/ops_fstype.c:1209
 get_tree_bdev+0x440/0x760 fs/super.c:1323
 gfs2_get_tree+0x4a/0x270 fs/gfs2/ops_fstype.c:1325
 vfs_get_tree+0x89/0x2f0 fs/super.c:1530
 do_new_mount fs/namespace.c:3040 [inline]
 path_mount+0x1326/0x1e20 fs/namespace.c:3370
 do_mount fs/namespace.c:3383 [inline]
 __do_sys_mount fs/namespace.c:3591 [inline]
 __se_sys_mount fs/namespace.c:3568 [inline]
 __x64_sys_mount+0x27f/0x300 fs/namespace.c:3568
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7fd9bd10d16a
Code: 83 c4 08 5b 5d c3 66 2e 0f 1f 84 00 00 00 00 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 c0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffcd1985f38 EFLAGS: 00000282 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007ffcd1985f90 RCX: 00007fd9bd10d16a
RDX: 0000000020000000 RSI: 0000000020000100 RDI: 00007ffcd1985f50
RBP: 00007ffcd1985f50 R08: 00007ffcd1985f90 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000282 R12: 0000000020000218
R13: 0000000000000003 R14: 0000000000000004 R15: 0000000000000001
 </TASK>
================================================================================

