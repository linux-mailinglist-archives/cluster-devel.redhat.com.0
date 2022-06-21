Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B22552E07
	for <lists+cluster-devel@lfdr.de>; Tue, 21 Jun 2022 11:14:36 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-204-hWQ5Y4kPNTOyYZZWOsAy8Q-1; Tue, 21 Jun 2022 05:14:32 -0400
X-MC-Unique: hWQ5Y4kPNTOyYZZWOsAy8Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A29411857F07;
	Tue, 21 Jun 2022 09:14:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 03538C28115;
	Tue, 21 Jun 2022 09:14:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BF946194704A;
	Tue, 21 Jun 2022 09:14:29 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9A74719466DF for <cluster-devel@listman.corp.redhat.com>;
 Tue, 21 Jun 2022 09:14:28 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 86C78C28118; Tue, 21 Jun 2022 09:14:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 82F4FC28115
 for <cluster-devel@redhat.com>; Tue, 21 Jun 2022 09:14:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B65F185A7B2
 for <cluster-devel@redhat.com>; Tue, 21 Jun 2022 09:14:28 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-461-JInS8necNgeKR2-scImcvA-1; Tue, 21 Jun 2022 05:14:24 -0400
X-MC-Unique: JInS8necNgeKR2-scImcvA-1
Received: by verein.lst.de (Postfix, from userid 2407)
 id 480AA68AA6; Tue, 21 Jun 2022 11:14:21 +0200 (CEST)
Date: Tue, 21 Jun 2022 11:14:21 +0200
From: Christoph Hellwig <hch@lst.de>
To: cluster-devel@redhat.com
Message-ID: <20220621091420.GC3256@lst.de>
MIME-Version: 1.0
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: [Cluster-devel] Mounting lock_nolock file systems?
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I'm felling a little stupid, but in the past after a

mkfs.gfs2  -O -p lock_nolock 

I could just mount the created file system locally.

On current mainline that does not seem to work any more, what am I
missing?

Here is the output from the mount attempt:

oot@testvm:~# mount /dev/vdb /mnt/
[  154.745017] gfs2: fsid=vdb: Trying to join cluster "lock_nolock", "vdb"
[  154.745024] gfs2: fsid=vdb: Now mounting FS (format 1801)...
[  154.782279] gfs2: fsid=vdb.0: journal 0 mapped with 1 extents in 0ms
[  154.784878] gfs2: fsid=vdb.0: jid=0, already locked for use
[  154.784885] gfs2: fsid=vdb.0: jid=0: Looking at journal...
[  154.787474] gfs2: fsid=vdb.0: jid=0: Journal head lookup took 2ms
[  154.787482] gfs2: fsid=vdb.0: jid=0: Acquiring the transaction lock...
[  154.787513] gfs2: fsid=vdb.0: jid=0: Replaying journal...0x0 to 0x0
[  154.787522] gfs2: fsid=vdb.0: jid=0: Replayed 0 of 0 blocks
[  154.787525] gfs2: fsid=vdb.0: jid=0: Found 0 revoke tags
[  154.788116] gfs2: fsid=vdb.0: jid=0: Journal replayed in 3ms [jlck:0ms, jhead:2ms, tl]
[  154.788239] gfs2: fsid=vdb.0: jid=0: Done
[  154.789896] gfs2: fsid=vdb.0: first mount done, others may mount
[  154.802688] gfs2: fsid=vdb.0: fatal: filesystem consistency error - function = gfs2_m5
[  154.802700] gfs2: fsid=vdb.0: about to withdraw this file system
[  185.894949] gfs2: fsid=vdb.0: Journal recovery skipped for jid 0 until next mount.
[  185.894975] gfs2: fsid=vdb.0: Glock dequeues delayed: 0
[  185.895202] gfs2: fsid=vdb.0: File system withdrawn
[  185.895220] CPU: 1 PID: 2777 Comm: mount Not tainted 5.19.0-rc3+ #1713
[  185.895229] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.14.0-2 04/04
[  185.895239] Call Trace:
[  185.895247]  <TASK>
[  185.895251]  dump_stack_lvl+0x45/0x5a
[  185.895276]  gfs2_withdraw.cold+0xdb/0x507
[  185.895305]  gfs2_fill_super+0xb5a/0xbe0
[  185.895312]  ? gfs2_fill_super+0x771/0xbe0
[  185.895319]  ? gfs2_fill_super+0xa22/0xbe0
[  185.895325]  ? gfs2_reconfigure+0x3c0/0x3c0
[  185.895330]  get_tree_bdev+0x169/0x270
[  185.895341]  gfs2_get_tree+0x19/0x80
[  185.895346]  vfs_get_tree+0x20/0xb0
[  185.895352]  path_mount+0x2b1/0xa70
[  185.895362]  __x64_sys_mount+0xfe/0x140
[  185.895370]  do_syscall_64+0x3b/0x90
[  185.895378]  entry_SYSCALL_64_after_hwframe+0x46/0xb0
[  185.895388] RIP: 0033:0x7fd8ba7269ea
[  185.895404] Code: 48 8b 0d a9 f4 0b 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 08
[  185.895410] RSP: 002b:00007ffea6838018 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
[  185.895419] RAX: ffffffffffffffda RBX: 00007fd8ba849264 RCX: 00007fd8ba7269ea
[  185.895423] RDX: 000055669b2724e0 RSI: 000055669b26dc50 RDI: 000055669b26b370
[  185.895427] RBP: 000055669b26b140 R08: 0000000000000000 R09: 00007fd8ba7e6be0
[  185.895431] R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
[  185.895434] R13: 000055669b26b370 R14: 000055669b2724e0 R15: 000055669b26b140
[  185.895443]  </TASK>
[  185.895461] gfs2: fsid=vdb.0: can't make FS RW: -5


