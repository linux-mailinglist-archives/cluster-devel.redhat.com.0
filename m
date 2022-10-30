Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 203F16132C1
	for <lists+cluster-devel@lfdr.de>; Mon, 31 Oct 2022 10:31:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667208665;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=y72qm/5pIvjeR0f8Y05KldTYpaZCuldykFLF92i5SRY=;
	b=b32ioblaZZB79e0rSVVq51zUsYlXLWgd7laq5uCzUh+hGSzRWXD/YfOYKBE+gNM8eD21gH
	8KGWz1DRDPOKs2QaC4hUYcJ0aVLhedRJyWVpavrbaFX1d+8Wl6Iei0Ftz9hiD7OUnPchnm
	CBKQfQyLtHNCmHbXDVbILYRvbvJvtCk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-220-LGcGixnaNtCUUTIH6DVlcQ-1; Mon, 31 Oct 2022 05:31:02 -0400
X-MC-Unique: LGcGixnaNtCUUTIH6DVlcQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E616F101A56D;
	Mon, 31 Oct 2022 09:31:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8A7C3477F5C;
	Mon, 31 Oct 2022 09:31:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5F3361946595;
	Mon, 31 Oct 2022 09:31:00 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 41FA81946589 for <cluster-devel@listman.corp.redhat.com>;
 Sun, 30 Oct 2022 09:10:38 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3C31E111DCE1; Sun, 30 Oct 2022 09:10:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 353DB111DCE0
 for <cluster-devel@redhat.com>; Sun, 30 Oct 2022 09:10:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 164C685A583
 for <cluster-devel@redhat.com>; Sun, 30 Oct 2022 09:10:38 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-331-392M2pBINgWO9srPxQTTMw-1; Sun, 30 Oct 2022 05:10:34 -0400
X-MC-Unique: 392M2pBINgWO9srPxQTTMw-1
Received: by mail-ej1-f47.google.com with SMTP id f27so22680168eje.1;
 Sun, 30 Oct 2022 02:10:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=y72qm/5pIvjeR0f8Y05KldTYpaZCuldykFLF92i5SRY=;
 b=QZKN5bcts7L60vnmbhA7iOuAaRHudB84d3bvNii5m7If6BHlD/NVPUvAIEchG7w+s0
 Es349wGQZe8i9YlOZo1v6wDqalXx29/2lkuE9BB7cwSt5ubOke6Gr1NldtaxogepLh+5
 /8OvvzGKlaXQj+xLJIwNxhx3p2LeEE9ndog0gdbXAn46a8qffYHibYYSpfhVsfSyzE8q
 AayCrzp8qkjZI7n5TzpgvMk5ylYxwVI8fM03FgcRtozt6INaSp7Xi5ocHwWNWaGI+jFB
 eEU/+7MEXH0ewZv/OFQhl1kmVi4SJZOpc7mlbEuITra8g0oJTHHbFIpK6jfWw9dRzZs/
 nlsw==
X-Gm-Message-State: ACrzQf35n7hbe7LKhIbSR1uQG1QEhFIyYK3zzCVWimWXj6I2J6DRwbXK
 oLBMRFraWKlQIdYod64zXGCnis/3gaVBDcUO/PcF7vFbLno=
X-Google-Smtp-Source: AMsMyM4lcK0krCAY2oO2Z3jJOJpSq6lP+PMGNXfS88yVZ44WJgmv7F0gsudzRXY82Yggh1dc7ShUbu2XOctUjtMeKDM=
X-Received: by 2002:a17:907:2da6:b0:78d:3cf1:9132 with SMTP id
 gt38-20020a1709072da600b0078d3cf19132mr7406717ejc.299.1667121032196; Sun, 30
 Oct 2022 02:10:32 -0700 (PDT)
MIME-Version: 1.0
From: Wei Chen <harperchen1110@gmail.com>
Date: Sun, 30 Oct 2022 17:09:56 +0800
Message-ID: <CAO4mrfd4=HRXMrcdZQUorNaFss3AFfrRxuXWMFT3uh+Dvfwb9g@mail.gmail.com>
To: rpeterso@redhat.com, agruenba@redhat.com, cluster-devel@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mailman-Approved-At: Mon, 31 Oct 2022 09:30:59 +0000
Subject: [Cluster-devel] BUG: unable to handle kernel NULL pointer
 dereference in gfs2_evict_inode
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
Cc: linux-kernel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Dear Linux Developer,

Recently when using our tool to fuzz kernel, the following crash was triggered:

HEAD commit: 64570fbc14f8 Linux 5.15-rc5
git tree: upstream
compiler: gcc 8.0.1
console output:
https://drive.google.com/file/d/1yppAEEN16x0lR3fd5t-NQ1itCoKLFtfP/view?usp=share_link
kernel config: https://drive.google.com/file/d/1uDOeEYgJDcLiSOrx9W8v2bqZ6uOA_55t/view?usp=share_link

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: Wei Chen <harperchen1110@gmail.com>

RBP: 0000000020000000 R08: 00007f39b7fa3af0 R09: 0000000020000000
R10: 0000000000000000 R11: 0000000000000206 R12: 0000000020000100
R13: 00007f39b7fa3ab0 R14: 0000000000000001 R15: 0000000020047a20
gfs2: fsid=syz:syz.0: can't lookup journal index: 0
BUG: kernel NULL pointer dereference, address: 000000000000008c
#PF: supervisor read access in kernel mode
#PF: error_code(0x0000) - not-present page
PGD c1e1067 P4D c1e1067 PUD 1a9e8067 PMD 0
Oops: 0000 [#1] PREEMPT SMP
CPU: 0 PID: 11045 Comm: syz-executor.0 Not tainted 5.15.0-rc5 #1
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
rel-1.13.0-48-gd9c812dda519-prebuilt.qemu.org 04/01/2014
RIP: 0010:gfs2_evict_inode+0x47b/0xb00
Code: 3b 14 ff be 01 00 00 00 48 89 df e8 af 6f 44 ff 48 8b bb b8 04
00 00 31 f6 e8 e1 47 fd ff 49 8b 87 00 09 00 00 31 f6 4c 89 ff <8b> 90
8c 00 00 00 e8 ba 4a 00 00 31 ff 41 89 c5 89 c6 e8 ae 3c 14
RSP: 0018:ffffc9000df7fb10 EFLAGS: 00010246
RAX: 0000000000000000 RBX: ffff888016648d10 RCX: 0000000000040000
RDX: ffffc900013d5000 RSI: 0000000000000000 RDI: ffff88801a800000
RBP: ffffc9000df7fbc0 R08: ffffffff8229378f R09: 0000000000000000
R10: 0000000000000005 R11: 0000000000000000 R12: ffff888016648f38
R13: 0000000000000000 R14: ffff88801a800000 R15: ffff88801a800000
FS:  00007f39b7fa4700(0000) GS:ffff88807dc00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000000000008c CR3: 0000000017567000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 evict+0x11c/0x230
 iput+0x2e9/0x500
 dentry_unlink_inode+0x111/0x1a0
 __dentry_kill+0x186/0x280
 dput.part.32+0x60d/0x940
 gfs2_fill_super+0x8c1/0x10f0
 get_tree_bdev+0x243/0x340
 gfs2_get_tree+0x24/0xd0
 vfs_get_tree+0x29/0x100
 path_mount+0x58e/0x10a0
 do_mount+0x9b/0xb0
 __x64_sys_mount+0x13a/0x150
 do_syscall_64+0x34/0xb0
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x46abda
Code: 48 c7 c1 bc ff ff ff f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f
84 00 00 00 00 00 0f 1f 44 00 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d
01 f0 ff ff 73 01 c3 48 c7 c1 bc ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f39b7fa3a48 EFLAGS: 00000206 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007f39b7fa3af0 RCX: 000000000046abda
RDX: 0000000020000000 RSI: 0000000020000100 RDI: 00007f39b7fa3ab0
RBP: 0000000020000000 R08: 00007f39b7fa3af0 R09: 0000000020000000
R10: 0000000000000000 R11: 0000000000000206 R12: 0000000020000100
R13: 00007f39b7fa3ab0 R14: 0000000000000001 R15: 0000000020047a20
Modules linked in:
CR2: 000000000000008c
---[ end trace 194497c38992c5b1 ]---
RIP: 0010:gfs2_evict_inode+0x47b/0xb00
Code: 3b 14 ff be 01 00 00 00 48 89 df e8 af 6f 44 ff 48 8b bb b8 04
00 00 31 f6 e8 e1 47 fd ff 49 8b 87 00 09 00 00 31 f6 4c 89 ff <8b> 90
8c 00 00 00 e8 ba 4a 00 00 31 ff 41 89 c5 89 c6 e8 ae 3c 14
RSP: 0018:ffffc9000df7fb10 EFLAGS: 00010246
RAX: 0000000000000000 RBX: ffff888016648d10 RCX: 0000000000040000
RDX: ffffc900013d5000 RSI: 0000000000000000 RDI: ffff88801a800000
RBP: ffffc9000df7fbc0 R08: ffffffff8229378f R09: 0000000000000000
R10: 0000000000000005 R11: 0000000000000000 R12: ffff888016648f38
R13: 0000000000000000 R14: ffff88801a800000 R15: ffff88801a800000
FS:  00007f39b7fa4700(0000) GS:ffff88807dc00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000000000008c CR3: 0000000017567000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0: 3b 14 ff              cmp    (%rdi,%rdi,8),%edx
   3: be 01 00 00 00        mov    $0x1,%esi
   8: 48 89 df              mov    %rbx,%rdi
   b: e8 af 6f 44 ff        callq  0xff446fbf
  10: 48 8b bb b8 04 00 00 mov    0x4b8(%rbx),%rdi
  17: 31 f6                xor    %esi,%esi
  19: e8 e1 47 fd ff        callq  0xfffd47ff
  1e: 49 8b 87 00 09 00 00 mov    0x900(%r15),%rax
  25: 31 f6                xor    %esi,%esi
  27: 4c 89 ff              mov    %r15,%rdi
* 2a: 8b 90 8c 00 00 00    mov    0x8c(%rax),%edx <-- trapping instruction
  30: e8 ba 4a 00 00        callq  0x4aef
  35: 31 ff                xor    %edi,%edi
  37: 41 89 c5              mov    %eax,%r13d
  3a: 89 c6                mov    %eax,%esi
  3c: e8                    .byte 0xe8
  3d: ae                    scas   %es:(%rdi),%al
  3e: 3c 14                cmp    $0x14,%al

Best,
Wei

