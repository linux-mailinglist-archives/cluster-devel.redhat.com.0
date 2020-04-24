Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id E71561B7988
	for <lists+cluster-devel@lfdr.de>; Fri, 24 Apr 2020 17:28:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587742097;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=OKRJMIwDxYePUZKZFPSTI87tbK37yLRtGEN+2uLNDCU=;
	b=UQAWmWUHpjr9wRNm5VgiKTNzrS+/tUcYpQDOBgwFxe2DdhJU6nqNCNkSGR5iPsDHlctxNe
	hPoyrJZ0YQMCd5E+db++qX9dx8NcmdBj8U/vDtry7eHfZBspVj0zAoK1x7mJHWbQAMQrtY
	mn9V6Txv9bhJnYOM+yyB/D8YCRQLryI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-n1rhQNNRNv2htw4bpN9YEQ-1; Fri, 24 Apr 2020 11:28:10 -0400
X-MC-Unique: n1rhQNNRNv2htw4bpN9YEQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1575F100CCC0;
	Fri, 24 Apr 2020 15:28:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A21A160C81;
	Fri, 24 Apr 2020 15:28:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 70A301809542;
	Fri, 24 Apr 2020 15:28:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03OFRvvn011784 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 24 Apr 2020 11:27:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C9E11114D0D; Fri, 24 Apr 2020 15:27:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C6055114CF5
	for <cluster-devel@redhat.com>; Fri, 24 Apr 2020 15:27:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 869CC1049842
	for <cluster-devel@redhat.com>; Fri, 24 Apr 2020 15:27:55 +0000 (UTC)
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
	[216.71.155.175]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-207-Qg6coQnDO_6mNnfgzxUqgg-1; Fri, 24 Apr 2020 11:27:50 -0400
X-MC-Unique: Qg6coQnDO_6mNnfgzxUqgg-1
IronPort-SDR: q1VbQrnnvpDOfyM16lJjVGnv687+AAdeqTWmD6/7gwo4lpQp7St6Vjuazh1xRKGtw3Tz/IgQzP
	tow0MWnrmLlzDcKMBL2bjIhgP1NbT9vTLscEx1tTsmZU3QoDJVPWjVj/3cfcQNv8zZ756+ZMbM
	4P9syUmnTB1cuMyJC/IEHVDZD6WqR5n2QISjokxRECmpImaF5KhpTXmsU9FJPG5URTneYBXcq7
	RjqzmuMQeHiXUuDBREaWfS7/P5z3Zzsgw043JH3O0hjizV1FXXUVgRCtWfCqOrPe0An/g5el5t
	Fos=
X-SBRS: 2.7
X-MesageID: 16610906
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,311,1583211600"; d="scan'208";a="16610906"
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <7514ea47-d0c5-ab01-8932-ab6602321b49@citrix.com>
Date: Fri, 24 Apr 2020 16:27:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] BUG during umount() after withdrawal
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Hi,

I'm doing some testing on 5.7-rc2 which includes Bob's recovery patches.
I used a new xfstest (see the end of this mail) which injects some
IO errors to force the filesystem to be withdrawn and then checks
that it can be remounted successfully.

However, it hits a BUG() during umount() after it has been
withdrawn:

[ 1767.777066] Buffer I/O error on dev dm-6, logical block 123711, lost async page write
[ 1767.777157] gfs2: fsid=dm-6.0: fatal: invalid metadata block
  bh = 123711 (magic number)
  function = gfs2_meta_indirect_buffer, file = /local/scratch/rossla/src/linux/fs/gfs2/meta_io.c, line = 417
[ 1767.777174] gfs2: fsid=dm-6.0: about to withdraw this file system
[ 1767.777289] gfs2: fsid=dm-6.0: Journal recovery complete for jid 0.
[ 1767.777289] gfs2: fsid=dm-6.0: Glock dequeues delayed: 0
[ 1767.777309] gfs2: fsid=dm-6.0: File system withdrawn
[ 1767.777318] CPU: 3 PID: 16840 Comm: xfs_io Not tainted 5.7.0-rc2.uup #1
[ 1767.777319] Hardware name: Supermicro X10SLE-F/HF/X10SLE, BIOS 2.00 04/24/2014
[ 1767.777320] Call Trace:
[ 1767.777330]  dump_stack+0x64/0x83
[ 1767.777337]  gfs2_withdraw+0x14c/0x470 [gfs2]
[ 1767.777343]  gfs2_meta_check_ii+0x37/0x50 [gfs2]
[ 1767.777347]  gfs2_meta_indirect_buffer+0x119/0x130 [gfs2]
[ 1767.777353]  gfs2_dinode_out+0x2b6/0x3c0 [gfs2]
[ 1767.777357]  ? gfs2_dinode_out+0x350/0x3c0 [gfs2]
[ 1767.777361]  __mark_inode_dirty+0x17c/0x360
[ 1767.777367]  gfs2_rlist_free+0x3bf/0x1450 [gfs2]
[ 1767.777371]  __writeback_single_inode+0x264/0x340
[ 1767.777374]  writeback_single_inode+0xad/0x120
[ 1767.777377]  sync_inode_metadata+0x3d/0x60
[ 1767.777381]  gfs2_set_aops+0xa9d/0x2110 [gfs2]
[ 1767.777384]  do_fsync+0x38/0x60
[ 1767.777386]  __x64_sys_fsync+0x10/0x20
[ 1767.777389]  do_syscall_64+0x4e/0x140
[ 1767.777393]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[ 1767.777397] RIP: 0033:0x7f343c0dae00
[ 1767.777399] Code: 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 83 3d 9d 61 2d 00 00 75 10 b8 4a 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 31 c3 48 83 ec 08 e8 be 6a 01 00 48 89 04 24
[ 1767.777402] RSP: 002b:00007fff030334a8 EFLAGS: 00000246 ORIG_RAX: 000000000000004a
[ 1767.777404] RAX: ffffffffffffffda RBX: 0000000000100000 RCX: 00007f343c0dae00
[ 1767.777406] RDX: 0000000000001000 RSI: 0000000001fcb000 RDI: 0000000000000003
[ 1767.777407] RBP: 0000000000000100 R08: 0000000000000000 R09: 00007f343c3ab760
[ 1767.777408] R10: 00007fff03032f20 R11: 0000000000000246 R12: 0000000000000000
[ 1767.777409] R13: 0000000000100000 R14: 00000000ffffffff R15: 0000000000000000
[ 1768.445648] device-mapper: thin: Data device (dm-4) discard unsupported: Disabling discard passdown.
[ 1768.445682] device-mapper: thin: 254:5: switching pool to write mode
[ 1768.445683] device-mapper: thin: 254:5: growing the data device from 1000 to 1200 blocks
[ 1768.555992] ------------[ cut here ]------------
[ 1768.555994] kernel BUG at /local/scratch/rossla/src/linux/fs/inode.c:1588!
[ 1768.556043] invalid opcode: 0000 [#1] SMP NOPTI
[ 1768.556048] CPU: 0 PID: 17061 Comm: umount Not tainted 5.7.0-rc2.uup #1
[ 1768.556053] Hardware name: Supermicro X10SLE-F/HF/X10SLE, BIOS 2.00 04/24/2014
[ 1768.556064] RIP: e030:iput+0x1a5/0x1b0
[ 1768.556068] Code: 8b 85 98 00 00 00 eb a5 48 89 ef e8 15 fe ff ff 4c 89 e7 e8 ed db e5 ff 66 90 e9 d9 fe ff ff 0f 0b eb 86 0f 0b e9 26 ff ff ff <0f> 0b 66 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 41 57 41 56 49 89
[ 1768.556081] RSP: e02b:ffffc90042c27df0 EFLAGS: 00010202
[ 1768.556086] RAX: dead000000000122 RBX: ffff888078c15cc0 RCX: 0000000080400001
[ 1768.556093] RDX: ffffc90042c27e18 RSI: 0000000000000001 RDI: ffff8880355c0b88
[ 1768.556099] RBP: ffff8880355c0b88 R08: 0000000000000001 R09: 0000000000000000
[ 1768.556105] R10: ffff88807eeef4c0 R11: 0000000000000018 R12: ffff88808aeac558
[ 1768.556111] R13: ffff88808aeac558 R14: ffff888004f45800 R15: ffff88809d1d8000
[ 1768.556127] FS:  00007fa3b6c58880(0000) GS:ffff8880a3800000(0000) knlGS:0000000000000000
[ 1768.556133] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1768.556138] CR2: 00007fa3b6c65000 CR3: 000000004f2a8000 CR4: 0000000000040660
[ 1768.556191] Call Trace:
[ 1768.556200]  gfs2_jindex_free+0xd5/0x110 [gfs2]
[ 1768.556207]  gfs2_make_fs_ro+0x57e/0x5e0 [gfs2]
[ 1768.556214]  generic_shutdown_super+0x6c/0x120
[ 1768.556219]  kill_block_super+0x21/0x50
[ 1768.556223]  deactivate_locked_super+0x3a/0x70
[ 1768.556229]  cleanup_mnt+0xc7/0x100
[ 1768.556234]  task_work_run+0x6f/0xa0
[ 1768.556241]  exit_to_usermode_loop+0x79/0xba
[ 1768.556246]  do_syscall_64+0x105/0x140
[ 1768.556252]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[ 1768.556257] RIP: 0033:0x7fa3b5ecac47
[ 1768.556262] Code: 72 2c 00 f7 d8 64 89 01 48 83 c8 ff c3 66 0f 1f 44 00 00 31 f6 e9 09 00 00 00 66 0f 1f 84 00 00 00 00 00 b8 a6 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 19 72 2c 00 f7 d8 64 89 01 48
[ 1768.556275] RSP: 002b:00007ffea1997548 EFLAGS: 00000246 ORIG_RAX: 00000000000000a6
[ 1768.556282] RAX: 0000000000000000 RBX: 000055e89843c060 RCX: 00007fa3b5ecac47
[ 1768.556288] RDX: 0000000000000001 RSI: 0000000000000000 RDI: 000055e898442c20
[ 1768.556294] RBP: 000055e898442c20 R08: 0000000000000000 R09: 000000000000000d
[ 1768.556300] R10: 00007ffea1996fa0 R11: 0000000000000246 R12: 00007fa3b6a45d58
[ 1768.556306] R13: 0000000000000000 R14: 000055e89843c230 R15: 000055e89843c060
[ 1768.556313] Modules linked in: dm_thin_pool dm_persistent_data dm_bio_prison dm_bufio gfs2 iscsi_tcp libiscsi_tcp libiscsi scsi_transport_iscsi nfsv3 nfs_acl nfs lockd grace fscache dlm bnx2fc cnic uio fcoe libfcoe libfc scsi_transport_fc bridge 8021q garp mrp stp llc ipt_REJECT nf_reject_ipv4 xt_tcpudp xt_multiport xt_conntrack nf_conntrack nf_defrag_ipv4 libcrc32c iptable_filter dm_multipath sunrpc intel_powerclamp dm_mod crct10dif_pclmul crc32_pclmul ghash_clmulni_intel sg aesni_intel crypto_simd cryptd igb glue_helper mei_me video mei ipmi_si backlight intel_pch_thermal ie31200_edac lpc_ich i2c_i801 ipmi_devintf ipmi_msghandler intel_rapl_perf ip_tables x_tables sr_mod cdrom uas usb_storage hid_generic usbhid hid sd_mod t10_pi ahci libahci libata xhci_pci ehci_pci ehci_hcd xhci_hcd scsi_dh_rdac scsi_dh_hp_sw scsi_dh_emc scsi_dh_alua scsi_mod xen_wdt ipv6 crc_ccitt nf_defrag_ipv6
[ 1768.556388] ---[ end trace 55e2822474182636 ]---
[ 1768.663384] RIP: e030:iput+0x1a5/0x1b0
[ 1768.663411] Code: 8b 85 98 00 00 00 eb a5 48 89 ef e8 15 fe ff ff 4c 89 e7 e8 ed db e5 ff 66 90 e9 d9 fe ff ff 0f 0b eb 86 0f 0b e9 26 ff ff ff <0f> 0b 66 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 41 57 41 56 49 89
[ 1768.663426] RSP: e02b:ffffc90042c27df0 EFLAGS: 00010202
[ 1768.663431] RAX: dead000000000122 RBX: ffff888078c15cc0 RCX: 0000000080400001
[ 1768.663437] RDX: ffffc90042c27e18 RSI: 0000000000000001 RDI: ffff8880355c0b88
[ 1768.663453] RBP: ffff8880355c0b88 R08: 0000000000000001 R09: 0000000000000000
[ 1768.663459] R10: ffff88807eeef4c0 R11: 0000000000000018 R12: ffff88808aeac558
[ 1768.663474] R13: ffff88808aeac558 R14: ffff888004f45800 R15: ffff88809d1d8000
[ 1768.663486] FS:  00007fa3b6c58880(0000) GS:ffff8880a3800000(0000) knlGS:0000000000000000
[ 1768.663493] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1768.663498] CR2: 00007fa3b6c65000 CR3: 000000004f2a8000 CR4: 0000000000040660

I bisected it to 601ef0d52e96 ("gfs2: Force withdraw to replay journals
and wait for it to finish"). Before that change, the testcase would
pass (which is an improvement over 4.19 where the fs gets corrupted).

This with a single-host cluster. The filesystem was created as follows:
mkfs.gfs2 -t xapi-clusterd:1514f728-6756-81 -p lock_dlm -J 32 -O -j 32 -K /dev/sdb

Any ideas?

Thanks,
Ross

-------8<----------
diff --git a/common/dmthin b/common/dmthin
index 7946e9a7..28f2ef9c 100644
--- a/common/dmthin
+++ b/common/dmthin
@@ -41,6 +41,12 @@ _dmthin_check_fs()
        _check_scratch_fs $DMTHIN_VOL_DEV
 }

+_dmthin_cycle_mount()
+{
+       $UMOUNT_PROG $SCRATCH_MNT > /dev/null 2>&1
+       _dmthin_mount
+}
+
 # Set up a dm-thin device on $SCRATCH_DEV
 #
 # All arguments are optional, and in this order; defaults follows:
diff --git a/tests/generic/593 b/tests/generic/593
new file mode 100755
index 00000000..0e8d137e
--- /dev/null
+++ b/tests/generic/593
@@ -0,0 +1,80 @@
+#! /bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (c) 2015 Red Hat, Inc.  All Rights Reserved.
+#
+# FS QA Test No. generic/593
+#
+# Test that intermittent IO errors during pwrite do not cause filesystem corruption
+
+seq=`basename $0`
+seqres=$RESULT_DIR/$seq
+echo "QA output created by $seq"
+
+here=`pwd`
+tmp=/tmp/$$
+
+status=1       # failure is the default!
+trap "_cleanup; exit \$status" 0 1 2 3 15
+
+BACKING_SIZE=$((500 * 1024 * 1024 / 512))      # 500M
+VIRTUAL_SIZE=$((10 * $BACKING_SIZE))           # 5000M
+GROW_SIZE=$((100 * 1024 * 1024 / 512))         # 100M
+
+_cleanup()
+{
+       _dmthin_cleanup
+       rm -f $tmp.*
+}
+
+_setup_thin()
+{
+       _dmthin_init $BACKING_SIZE $VIRTUAL_SIZE
+       _dmthin_set_queue
+       _mkfs_dev $DMTHIN_VOL_DEV
+       _dmthin_mount
+}
+
+_workout()
+{
+       # Overfill it by a bit
+       for I in `seq 1 500`; do
+               $XFS_IO_PROG -f -c "pwrite -W 0 1M" $SCRATCH_MNT/file$I &>/dev/null
+       done
+
+       sync
+
+       _dmthin_grow  $GROW_SIZE
+
+       # Write a little more, but don't fill
+       for I in `seq 501 510`; do
+               $XFS_IO_PROG -f -c "pwrite 0 1M" $SCRATCH_MNT/file$I &>/dev/null
+       done
+}
+
+# get standard environment, filters and checks
+. ./common/rc
+. ./common/dmthin
+
+_supported_fs generic
+_supported_os Linux
+_require_scratch_nocheck
+_require_dm_target thin-pool
+
+_setup_thin
+
+# trigger IO errors, the filesystem may be remounted RO or withdrawn, this is expected
+_workout
+
+# now remount the filesystem without triggering IO errors,
+# and check that the filesystem is not corrupt
+_dmthin_cycle_mount
+# ls --color makes ls stat each file, which finds the corruption
+ls --color=always $SCRATCH_MNT/ >/dev/null || _fail "Failed to list filesystem after remount"
+ls --color=always $SCRATCH_MNT/ >/dev/null || _fail "Failed to list filesystem after remount"
+ls --color=always $SCRATCH_MNT/ >/dev/null || _fail "Failed to list filesystem after remount"
+_dmthin_cleanup
+
+echo "=== completed"
+
+status=0
+exit
diff --git a/tests/generic/593.out b/tests/generic/593.out
new file mode 100644
index 00000000..5140d261
--- /dev/null
+++ b/tests/generic/593.out
@@ -0,0 +1,2 @@
+QA output created by 593
+=== completed
diff --git a/tests/generic/group b/tests/generic/group
index 6fe62505..25b020d3 100644
--- a/tests/generic/group
+++ b/tests/generic/group
@@ -595,3 +595,4 @@
 590 auto prealloc preallocrw
 591 auto quick rw pipe splice
 592 auto quick encrypt
+593 auto quick rw thin

