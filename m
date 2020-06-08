Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 87D4E1F170E
	for <lists+cluster-devel@lfdr.de>; Mon,  8 Jun 2020 12:56:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591613804;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2HB2FdAsJ3vRjrRI7vaai0L24i3xZYfh3N+GZiAI7Z4=;
	b=Eoz26XMYrfJut4FtoUESZQ8SOVFP0CEu/iBMhzAovjXb00fBPiRRRHBhNU79SeLKGLb365
	MjHzzX3HYgbA9nuy3vjDL0caPP0Ocxe5LoHg/IKt2TKtEOChy/TXgB8eYKc6cG9lsRjELa
	7ks6zI9z9uSRYfRxDf4rn/J+Eqyfwds=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-82-in2xpOncOQytnfcIBDFcXA-1; Mon, 08 Jun 2020 06:56:39 -0400
X-MC-Unique: in2xpOncOQytnfcIBDFcXA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D722107ACCA;
	Mon,  8 Jun 2020 10:56:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3173010013D4;
	Mon,  8 Jun 2020 10:56:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CB2ED180954D;
	Mon,  8 Jun 2020 10:56:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 058AuTGa004973 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 8 Jun 2020 06:56:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3B00710F8E22; Mon,  8 Jun 2020 10:56:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 28FDC10F8E21
	for <cluster-devel@redhat.com>; Mon,  8 Jun 2020 10:56:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E3AEA8007A4
	for <cluster-devel@redhat.com>; Mon,  8 Jun 2020 10:56:25 +0000 (UTC)
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
	[216.71.155.168]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-331-TOvfdIXvPwmliicL5y899A-1; Mon, 08 Jun 2020 06:56:23 -0400
X-MC-Unique: TOvfdIXvPwmliicL5y899A-1
IronPort-SDR: R98HuWxY5vht3ccDchqp/J6mBg37Kv79/EH9QUWMpCeIDv6NQf7SoIMVdoKBC5mMd8aPV+iphJ
	mvANf2NfHgkaTnaNxf82Gr+ti5num0u6cEEngCMfh/OZ9EuR9C9YminU7yhVkz46M2bRjRCDay
	oTUdgHMOqlkx3xSHlNSUDeRBCroZj4epsoz5UfpAd1OysJ2zVOE0q5Sofcal4aTVLF0F+b+/qh
	0QPRKiGNLXXDziE6YLIoG3qOgEgDMOtaFOnc8xmCfmmo/RP7S3jP1ZEG0ifNscPmPwACaGdSux
	oO8=
X-SBRS: 2.7
X-MesageID: 19705664
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,487,1583211600"; d="scan'208";a="19705664"
To: <cluster-devel@redhat.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <185165b1-a06f-048d-9045-905573f812c9@citrix.com>
Date: Mon, 8 Jun 2020 11:55:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.9.0
MIME-Version: 1.0
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] BUG() in iput() during unmount
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Hi,

During some testing, I hit an issue during unmount that was seems quite
similar to the problem I reported a few weeks ago (BUG during umount() after
withdrawal). I am using 5.7.1 which includes the patches for the earlier issue.
Here is the log:

[  304.212698]  connection1:0: ping timeout of 5 secs expired, recv timeout 5, last rx 4294965568, last ping 4294966848, now 4294968128
[  304.212834]  connection1:0: detected conn error (1022)
[  332.856419] sd 8:0:0:0: rejecting I/O to offline device
[  332.856473] blk_update_request: I/O error, dev sdb, sector 2168544 op 0x0:(READ) flags 0x3000 phys_seg 1 prio class 0
[  332.856490] blk_update_request: I/O error, dev sdb, sector 47608 op 0x1:(WRITE) flags 0x0 phys_seg 2 prio class 0
[  332.856500] gfs2: fsid=xapi-clusterd:16d3f769-afce-7d.0: Error 10 writing to journal, jid=0
[  332.856525] gfs2: fsid=xapi-clusterd:16d3f769-afce-7d.0: fatal: I/O error(s)
[  332.856537] gfs2: fsid=xapi-clusterd:16d3f769-afce-7d.0: about to withdraw this file system
[  332.856539] gfs2: fsid=xapi-clusterd:16d3f769-afce-7d.0: dirty_inode: gfs2_trans_begin -30
[  332.856571] gfs2: fsid=xapi-clusterd:16d3f769-afce-7d.0: The logd daemon is withdrawing.
[  332.856598] gfs2: fsid=xapi-clusterd:16d3f769-afce-7d.0: Requesting recovery of jid 0.
[  332.857124] sd 8:0:0:0: [sdb] Synchronizing SCSI cache
[  332.857157] sd 8:0:0:0: [sdb] Synchronize Cache(10) failed: Result: hostbyte=DID_TRANSPORT_FAILFAST driverbyte=DRIVER_OK
[  332.920535] gfs2: fsid=xapi-clusterd:16d3f769-afce-7d.0: No other mounters found. Trying to recover our own journal jid 0.
[  332.920540] gfs2: fsid=xapi-clusterd:16d3f769-afce-7d.0: jid=0: Recovery not attempted due to withdraw.
[  332.920641] gfs2: fsid=xapi-clusterd:16d3f769-afce-7d.0: recovery_result jid 0 ignored due to withdraw.
[  332.920683] gfs2: fsid=xapi-clusterd:16d3f769-afce-7d.0: Reprocessing of jid 0 failed with -5.
[  332.920684] gfs2: fsid=xapi-clusterd:16d3f769-afce-7d.0: Journal recovery complete for jid 0.
[  332.920684] gfs2: fsid=xapi-clusterd:16d3f769-afce-7d.0: Glock dequeues delayed: 1
[  332.920706] ------------[ cut here ]------------
[  332.920708] bdi-block not registered
[  332.920719] WARNING: CPU: 5 PID: 6236 at /local/scratch/rossla/src/linux/fs/fs-writeback.c:2323 __mark_inode_dirty+0x269/0x360
[  332.920719] Modules linked in: gfs2 iscsi_tcp libiscsi_tcp libiscsi scsi_transport_iscsi rpcsec_gss_krb5 auth_rpcgss oid_registry nfsv4 nfs lockd grace md4 cmac nls_utf8 cifs libarc4 fscache libdes dlm bnx2fc cnic uio fcoe libfcoe libfc scsi_transport_fc 8021q garp mrp stp llc openvswitch nsh nf_conncount nf_nat ipt_REJECT nf_reject_ipv4 xt_tcpudp xt_multiport xt_conntrack nf_conntrack nf_defrag_ipv4 libcrc32c dm_multipath iptable_filter sunrpc dm_mod intel_powerclamp crct10dif_pclmul crc32_pclmul ghash_clmulni_intel aesni_intel crypto_simd cryptd sg glue_helper igb mei_me video mei intel_rapl_perf ie31200_edac i2c_i801 acpi_power_meter intel_pch_thermal ipmi_si backlight ipmi_devintf ipmi_msghandler ip_tables x_tables hid_generic usbhid hid sd_mod t10_pi ahci libahci xhci_pci intel_ish_ipc libata xhci_hcd intel_ishtp scsi_dh_rdac scsi_dh_hp_sw scsi_dh_emc scsi_dh_alua scsi_mod xen_wdt ipv6 crc_ccitt nf_defrag_ipv6
[  332.920763] CPU: 5 PID: 6236 Comm: python2 Not tainted 5.7.1.uup2 #2
[  332.920764] Hardware name: Supermicro MBI-6119G-T4/B2SS1-F, BIOS 2.0a 06/10/2017
[  332.920765] RIP: e030:__mark_inode_dirty+0x269/0x360
[  332.920766] Code: f6 ff ff 48 89 c5 48 8b 00 f6 40 5c 02 75 1d 48 8b 55 08 83 e2 01 75 14 48 8b 70 50 48 c7 c7 1c 83 e8 81 31 c0 e8 17 26 df ff <0f> 0b 48 8b 05 5e bf d7 00 45 85 f6 49 89 84 24 c8 00 00 00 74 0f
[  332.920767] RSP: e02b:ffffc90041653d28 EFLAGS: 00010282
[  332.920768] RAX: 0000000000000000 RBX: 0000000000000001 RCX: 0000000000000001
[  332.920768] RDX: 0000000000000001 RSI: 0000000000000001 RDI: ffff88811a159840
[  332.920769] RBP: ffff888109674878 R08: 0000000000000422 R09: 0000000000000422
[  332.920769] R10: 0000000000000028 R11: ffffffff82602544 R12: ffff888071c99ec0
[  332.920769] R13: ffff888071c99f48 R14: 0000000000000000 R15: 0000000000000000
[  332.920777] FS:  00007f77e53eb740(0000) GS:ffff88811a140000(0000) knlGS:0000000000000000
[  332.920778] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
[  332.920778] CR2: 00007fab6c9885b0 CR3: 000000007690a000 CR4: 0000000000040660
[  332.920782] Call Trace:
[  332.920786]  generic_update_time+0x6b/0xd0
[  332.920787]  file_update_time+0xaa/0xf0
[  332.920792]  gfs2_set_aops+0x1ed7/0x2130 [gfs2]
[  332.920794]  ? get_signal+0x479/0x8f0
[  332.920796]  new_sync_write+0x11e/0x1a0
[  332.920798]  vfs_write+0xad/0x1a0
[  332.920799]  ? kern_select+0xc9/0x100
[  332.920800]  ksys_write+0x55/0xd0
[  332.920802]  do_syscall_64+0x4e/0x140
[  332.920804]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[  332.920805] RIP: 0033:0x7f77e4209cd0
[  332.920806] Code: 73 01 c3 48 8b 0d c0 61 2d 00 f7 d8 64 89 01 48 83 c8 ff c3 66 0f 1f 44 00 00 83 3d cd c2 2d 00 00 75 10 b8 01 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 31 c3 48 83 ec 08 e8 ee cb 01 00 48 89 04 24
[  332.920807] RSP: 002b:00007ffe316f5108 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
[  332.920808] RAX: ffffffffffffffda RBX: 0000000000000005 RCX: 00007f77e4209cd0
[  332.920808] RDX: 0000000000000005 RSI: 00007f77e53f7000 RDI: 0000000000000003
[  332.920808] RBP: 00007f77e53f7000 R08: 00007f77e53eb740 R09: 000000000073c0a0
[  332.920822] R10: 000000000000006a R11: 0000000000000246 R12: 0000000000775250
[  332.920823] R13: 0000000000000005 R14: 00007f77e5393050 R15: 00007f77e5295830
[  332.920824] ---[ end trace 3cb072c1f481ae5c ]---
[  332.921511] Buffer I/O error on dev sdb, logical block 262833, lost async page write
[  332.921537] ------------[ cut here ]------------
[  332.921544] WARNING: CPU: 5 PID: 421 at /local/scratch/rossla/src/linux/fs/gfs2/glops.c:189 gfs2_unregister_debugfs+0xafc/0xb10 [gfs2]
[  332.921544] Modules linked in: gfs2 iscsi_tcp libiscsi_tcp libiscsi scsi_transport_iscsi rpcsec_gss_krb5 auth_rpcgss oid_registry nfsv4 nfs lockd grace md4 cmac nls_utf8 cifs libarc4 fscache libdes dlm bnx2fc cnic uio fcoe libfcoe libfc scsi_transport_fc 8021q garp mrp stp llc openvswitch nsh nf_conncount nf_nat ipt_REJECT nf_reject_ipv4 xt_tcpudp xt_multiport xt_conntrack nf_conntrack nf_defrag_ipv4 libcrc32c dm_multipath iptable_filter sunrpc dm_mod intel_powerclamp crct10dif_pclmul crc32_pclmul ghash_clmulni_intel aesni_intel crypto_simd cryptd sg glue_helper igb mei_me video mei intel_rapl_perf ie31200_edac i2c_i801 acpi_power_meter intel_pch_thermal ipmi_si backlight ipmi_devintf ipmi_msghandler ip_tables x_tables hid_generic usbhid hid sd_mod t10_pi ahci libahci xhci_pci intel_ish_ipc libata xhci_hcd intel_ishtp scsi_dh_rdac scsi_dh_hp_sw scsi_dh_emc scsi_dh_alua scsi_mod xen_wdt ipv6 crc_ccitt nf_defrag_ipv6
[  332.921565] CPU: 5 PID: 421 Comm: kworker/5:1H Tainted: G        W         5.7.1.uup2 #2
[  332.921566] Hardware name: Supermicro MBI-6119G-T4/B2SS1-F, BIOS 2.0a 06/10/2017
[  332.921571] Workqueue: glock_workqueue gfs2_glock_dq_uninit [gfs2]
[  332.921573] RIP: e030:gfs2_unregister_debugfs+0xafc/0xb10 [gfs2]
[  332.921574] Code: e8 59 66 01 00 48 89 ef e8 31 75 86 c0 66 90 5b 5d 44 89 e0 41 5c 41 5d c3 ba 01 00 00 00 48 89 de 31 ff e8 96 d0 ff ff 0f 0b <0f> 0b 89 c6 4c 89 ef e8 31 00 02 00 eb b4 66 0f 1f 44 00 00 0f 1f
[  332.921575] RSP: e02b:ffffc9004050bde0 EFLAGS: 00010282
[  332.921575] RAX: 00000000fffffffb RBX: ffff888108c6d570 RCX: 0000000000ffffff
[  332.921576] RDX: 0000000000000001 RSI: 00000000000402b5 RDI: ffff888111574748
[  332.921578] RBP: ffff888108c6d590 R08: ffff88807e5e6fe8 R09: 0000000001000000
[  332.921579] R10: 0000000001000000 R11: 0000000000000228 R12: 00000000fffffffb
[  332.921580] R13: ffff888111574748 R14: ffffffffc088c3a0 R15: ffff888108c6d590
[  332.921590] FS:  00007f77e53eb740(0000) GS:ffff88811a140000(0000) knlGS:0000000000000000
[  332.921590] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
[  332.921591] CR2: 00007fab6c9885b0 CR3: 0000000002008000 CR4: 0000000000040660
[  332.921598] Call Trace:
[  332.921601]  gfs2_glock_dq_uninit+0x4c6/0x9c0 [gfs2]
[  332.921603]  gfs2_glock_dq_uninit+0x908/0x9c0 [gfs2]
[  332.921607]  process_one_work+0x166/0x370
[  332.921609]  worker_thread+0x49/0x3e0
[  332.921610]  kthread+0xf8/0x130
[  332.921611]  ? rescuer_thread+0x330/0x330
[  332.921612]  ? kthread_bind+0x10/0x10
[  332.921614]  ret_from_fork+0x35/0x40
[  332.921617] ---[ end trace 3cb072c1f481ae5d ]---
[  332.921620] gfs2: fsid=xapi-clusterd:16d3f769-afce-7d.0: Error -5 syncing glock
[  332.921631] gfs2: fsid=xapi-clusterd:16d3f769-afce-7d.0: G:  s:EX n:3/402b1 f:lDpiIqo t:UN d:UN/0 a:0 v:0 r:3 m:50
[  332.921646] gfs2: fsid=xapi-clusterd:16d3f769-afce-7d.0:  R: n:262833 f:b0000000 b:57279/57279 i:107 r:0 e:57311
[  332.921733] ------------[ cut here ]------------
[  332.921734] kernel BUG at /local/scratch/rossla/src/linux/fs/inode.c:1588!
[  332.921746] invalid opcode: 0000 [#1] SMP NOPTI
[  332.921751] CPU: 5 PID: 6236 Comm: python2 Tainted: G        W         5.7.1.uup2 #2
[  332.921758] Hardware name: Supermicro MBI-6119G-T4/B2SS1-F, BIOS 2.0a 06/10/2017
[  332.921767] RIP: e030:iput+0x1a5/0x1b0
[  332.921771] Code: 8b 85 98 00 00 00 eb a5 48 89 ef e8 15 fe ff ff 4c 89 e7 e8 dd d8 e5 ff 66 90 e9 d9 fe ff ff 0f 0b eb 86 0f 0b e9 26 ff ff ff <0f> 0b 66 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 41 57 41 56 49 89
[  332.921786] RSP: e02b:ffffc90041653c30 EFLAGS: 00010202
[  332.921791] RAX: dead000000000122 RBX: ffff888004190240 RCX: 0000000080400001
[  332.921798] RDX: ffff888004190e40 RSI: 0000000000000001 RDI: ffff888071c75c40
[  332.921805] RBP: ffff888071c75c40 R08: 0000000000000001 R09: 0000000000000000
[  332.921811] R10: ffff888004548140 R11: 0000000000000000 R12: ffff888111574558
[  332.921818] R13: ffff888111574558 R14: ffff88810fe92000 R15: ffff88806fb9d7c0
[  332.921830] FS:  00007f77e53eb740(0000) GS:ffff88811a140000(0000) knlGS:0000000000000000
[  332.921837] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
[  332.921843] CR2: 00007fab6c9885b0 CR3: 0000000002008000 CR4: 0000000000040660
[  332.921853] Call Trace:
[  332.921859]  gfs2_jindex_free+0xd5/0x110 [gfs2]
[  332.921866]  gfs2_make_fs_ro+0x57e/0x5e0 [gfs2]
[  332.921872]  generic_shutdown_super+0x6c/0x120
[  332.921878]  kill_block_super+0x21/0x50
[  332.921882]  deactivate_locked_super+0x3a/0x70
[  332.921891]  cleanup_mnt+0xc7/0x100
[  332.921896]  task_work_run+0x6f/0xa0
[  332.921901]  do_exit+0x2a8/0xb60
[  332.921906]  do_group_exit+0x39/0xa0
[  332.921910]  get_signal+0x17f/0x8f0
[  332.921915]  do_signal+0x30/0x690
[  332.921921]  exit_to_usermode_loop+0x5e/0xba
[  332.921927]  do_syscall_64+0x105/0x140
[  332.921931]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[  332.921936] RIP: 0033:0x7f77e4209cd0
[  332.921945] Code: Bad RIP value.
[  332.921948] RSP: 002b:00007ffe316f5108 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
[  332.921955] RAX: fffffffffffffffb RBX: 0000000000000005 RCX: 00007f77e4209cd0
[  332.921962] RDX: 0000000000000005 RSI: 00007f77e53f7000 RDI: 0000000000000003
[  332.921969] RBP: 00007f77e53f7000 R08: 00007f77e53eb740 R09: 000000000073c0a0
[  332.921975] R10: 000000000000006a R11: 0000000000000246 R12: 0000000000775250
[  332.921982] R13: 0000000000000005 R14: 00007f77e5393050 R15: 00007f77e5295830
[  332.921989] Modules linked in: gfs2 iscsi_tcp libiscsi_tcp libiscsi scsi_transport_iscsi rpcsec_gss_krb5 auth_rpcgss oid_registry nfsv4 nfs lockd grace md4 cmac nls_utf8 cifs libarc4 fscache libdes dlm bnx2fc cnic uio fcoe libfcoe libfc scsi_transport_fc 8021q garp mrp stp llc openvswitch nsh nf_conncount nf_nat ipt_REJECT nf_reject_ipv4 xt_tcpudp xt_multiport xt_conntrack nf_conntrack nf_defrag_ipv4 libcrc32c dm_multipath iptable_filter sunrpc dm_mod intel_powerclamp crct10dif_pclmul crc32_pclmul ghash_clmulni_intel aesni_intel crypto_simd cryptd sg glue_helper igb mei_me video mei intel_rapl_perf ie31200_edac i2c_i801 acpi_power_meter intel_pch_thermal ipmi_si backlight ipmi_devintf ipmi_msghandler ip_tables x_tables hid_generic usbhid hid sd_mod t10_pi ahci libahci xhci_pci intel_ish_ipc libata xhci_hcd intel_ishtp scsi_dh_rdac scsi_dh_hp_sw scsi_dh_emc scsi_dh_alua scsi_mod xen_wdt ipv6 crc_ccitt nf_defrag_ipv6
[  332.922067] ---[ end trace 3cb072c1f481ae5e ]---
[  334.650814] RIP: e030:iput+0x1a5/0x1b0
[  334.650865] Code: 8b 85 98 00 00 00 eb a5 48 89 ef e8 15 fe ff ff 4c 89 e7 e8 dd d8 e5 ff 66 90 e9 d9 fe ff ff 0f 0b eb 86 0f 0b e9 26 ff ff ff <0f> 0b 66 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 41 57 41 56 49 89
[  334.650880] RSP: e02b:ffffc90041653c30 EFLAGS: 00010202
[  334.650886] RAX: dead000000000122 RBX: ffff888004190240 RCX: 0000000080400001
[  334.650892] RDX: ffff888004190e40 RSI: 0000000000000001 RDI: ffff888071c75c40
[  334.650899] RBP: ffff888071c75c40 R08: 0000000000000001 R09: 0000000000000000
[  334.650909] R10: ffff888004548140 R11: 0000000000000000 R12: ffff888111574558
[  334.650916] R13: ffff888111574558 R14: ffff88810fe92000 R15: ffff88806fb9d7c0
[  334.650928] FS:  00007f77e53eb740(0000) GS:ffff88811a140000(0000) knlGS:0000000000000000
[  334.650935] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
[  334.650941] CR2: 00007f77e4209ca6 CR3: 0000000002008000 CR4: 0000000000040660
[  334.650952] Fixing recursive fault but reboot is needed!
[  334.679677] gfs2: fsid=xapi-clusterd:16d3f769-afce-7d.0: telling LM to unmount
[  334.679701] dlm: 16d3f769-afce-7d: leaving the lockspace group...
[  334.680051] gfs2: fsid=xapi-clusterd:16d3f769-afce-7d.0: recover_prep ignored due to withdraw.
[  334.680152] dlm: 16d3f769-afce-7d: group event done 0 0
[  334.680280] dlm: 16d3f769-afce-7d: release_lockspace final free
[  334.680300] gfs2: fsid=xapi-clusterd:16d3f769-afce-7d.0: File system withdrawn
[  334.680308] CPU: 6 PID: 6098 Comm: gfs2_logd Tainted: G      D W         5.7.1.uup2 #2
[  334.680315] Hardware name: Supermicro MBI-6119G-T4/B2SS1-F, BIOS 2.0a 06/10/2017
[  334.680322] Call Trace:
[  334.680332]  dump_stack+0x64/0x83
[  334.680340]  gfs2_withdraw+0x147/0x450 [gfs2]
[  334.680350]  gfs2_add_revoke+0x304/0x320 [gfs2]
[  334.680361]  gfs2_logd+0x334/0x14f0 [gfs2]
[  334.680368]  ? wait_woken+0x80/0x80
[  334.680374]  kthread+0xf8/0x130
[  334.680380]  ? gfs2_log_commit+0x350/0x350 [gfs2]
[  334.680386]  ? kthread_bind+0x10/0x10
[  334.680395]  ret_from_fork+0x35/0x40
[  334.680416] BUG: kernel NULL pointer dereference, address: 000000000000005c
[  334.680423] #PF: supervisor read access in kernel mode
[  334.680428] #PF: error_code(0x0000) - not-present page
[  334.680438] PGD 0 P4D 0
[  334.680445] Oops: 0000 [#2] SMP NOPTI
[  334.680452] CPU: 6 PID: 6098 Comm: gfs2_logd Tainted: G      D W         5.7.1.uup2 #2
[  334.680460] Hardware name: Supermicro MBI-6119G-T4/B2SS1-F, BIOS 2.0a 06/10/2017
[  334.680469] RIP: e030:gfs2_logd+0x132/0x14f0 [gfs2]
[  334.680475] Code: 00 00 41 8b be 38 08 00 00 41 8b b6 30 08 00 00 01 fa 29 ca 39 f2 0f 83 f6 01 00 00 49 8b 96 88 05 00 00 41 8b 8e 34 08 00 00 <8b> 52 5c f0 49 0f ba 76 50 09 0f 82 a5 01 00 00 41 8b be 38 08 00
[  334.680493] RSP: e02b:ffffc90041013ea8 EFLAGS: 00010282
[  334.680499] RAX: 0000000000000001 RBX: ffff888111574050 RCX: 0000000000001ff1
[  334.680509] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
[  334.680518] RBP: 0000000000000000 R08: ffffffff82263880 R09: ffffffff8226387c
[  334.680525] R10: ffffffff818001fa R11: 0000000000000000 R12: ffff888111574858
[  334.680532] R13: ffff888111574280 R14: ffff888111574000 R15: ffff888108cf1d40
[  334.680546] FS:  00007f838bf868c0(0000) GS:ffff88811a180000(0000) knlGS:0000000000000000
[  334.680553] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
[  334.680559] CR2: 000000000000005c CR3: 0000000113c78000 CR4: 0000000000040660
[  334.680570] Call Trace:
[  334.680575]  ? wait_woken+0x80/0x80
[  334.680580]  kthread+0xf8/0x130
[  334.680585]  ? gfs2_log_commit+0x350/0x350 [gfs2]
[  334.680591]  ? kthread_bind+0x10/0x10
[  334.680596]  ret_from_fork+0x35/0x40
[  334.680601] Modules linked in: gfs2 iscsi_tcp libiscsi_tcp libiscsi scsi_transport_iscsi rpcsec_gss_krb5 auth_rpcgss oid_registry nfsv4 nfs lockd grace md4 cmac nls_utf8 cifs libarc4 fscache libdes dlm bnx2fc cnic uio fcoe libfcoe libfc scsi_transport_fc 8021q garp mrp stp llc openvswitch nsh nf_conncount nf_nat ipt_REJECT nf_reject_ipv4 xt_tcpudp xt_multiport xt_conntrack nf_conntrack nf_defrag_ipv4 libcrc32c dm_multipath iptable_filter sunrpc dm_mod intel_powerclamp crct10dif_pclmul crc32_pclmul ghash_clmulni_intel aesni_intel crypto_simd cryptd sg glue_helper igb mei_me video mei intel_rapl_perf ie31200_edac i2c_i801 acpi_power_meter intel_pch_thermal ipmi_si backlight ipmi_devintf ipmi_msghandler ip_tables x_tables hid_generic usbhid hid sd_mod t10_pi ahci libahci xhci_pci intel_ish_ipc libata xhci_hcd intel_ishtp scsi_dh_rdac scsi_dh_hp_sw scsi_dh_emc scsi_dh_alua scsi_mod xen_wdt ipv6 crc_ccitt nf_defrag_ipv6
[  334.680681] CR2: 000000000000005c
[  334.680685] ---[ end trace 3cb072c1f481ae5f ]---
[  334.684212] RIP: e030:iput+0x1a5/0x1b0
[  334.684261] Code: 8b 85 98 00 00 00 eb a5 48 89 ef e8 15 fe ff ff 4c 89 e7 e8 dd d8 e5 ff 66 90 e9 d9 fe ff ff 0f 0b eb 86 0f 0b e9 26 ff ff ff <0f> 0b 66 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 41 57 41 56 49 89
[  334.684278] RSP: e02b:ffffc90041653c30 EFLAGS: 00010202
[  334.684283] RAX: dead000000000122 RBX: ffff888004190240 RCX: 0000000080400001
[  334.684290] RDX: ffff888004190e40 RSI: 0000000000000001 RDI: ffff888071c75c40
[  334.684296] RBP: ffff888071c75c40 R08: 0000000000000001 R09: 0000000000000000
[  334.684303] R10: ffff888004548140 R11: 0000000000000000 R12: ffff888111574558
[  334.684310] R13: ffff888111574558 R14: ffff88810fe92000 R15: ffff88806fb9d7c0
[  334.684322] FS:  00007f838bf868c0(0000) GS:ffff88811a180000(0000) knlGS:0000000000000000
[  334.684329] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
[  334.684335] CR2: 000000000000005c CR3: 0000000113c78000 CR4: 0000000000040660

Steps to reproduce this:

Log into an iSCSI target:
$ iscsiadm -m discovery -t sendtargets  -p 10.71.57.19
$ iscsiadm -m node -T iqn.2014-08.com.example:t1 -p 10.71.57.19 -l

Mount the GFS2 fs somewhere:
$ mount /dev/sdb /mnt

Run a program to write to disk slowly:

$ cat wedge.py
import time
import sys

f = open(sys.argv[1], 'w')
while True:
    f.write('blah\n')
    f.flush()
    time.sleep(1)

$ python2 wedge.py /mnt/test.txt &
[1] 6872

Check that it is working:

$ cat /mnt/test2.txt
blah
$ cat /mnt/test2.txt
blah
blah
$ cat /mnt/test2.txt
blah
blah
blah

Kill the iSCSI connection:

$ iptables -I RH-Firewall-1-INPUT -s 10.71.57.19 -j DROP

Wait for the Python process to become blocked:

$ ~]# cat /proc/6872/stack
[<0>] gfs2_log_reserve+0x13d/0x2e0 [gfs2]
[<0>] gfs2_trans_begin+0xc5/0x140 [gfs2]
[<0>] gfs2_dinode_out+0x324/0x3c0 [gfs2]
[<0>] __mark_inode_dirty+0x17c/0x360
[<0>] generic_update_time+0x6b/0xd0
[<0>] file_update_time+0xaa/0xf0
[<0>] gfs2_set_aops+0x1ed7/0x2130 [gfs2]
[<0>] new_sync_write+0x11e/0x1a0
[<0>] vfs_write+0xad/0x1a0
[<0>] ksys_write+0x55/0xd0
[<0>] do_syscall_64+0x4e/0x140
[<0>] entry_SYSCALL_64_after_hwframe+0x44/0xa9

Do a force, lazy unmount and logout of the iSCSI target:

$ umount -f -l /mnt; iscsiadm -m node -T iqn.2014-08.com.example:t1 -p 10.71.57.19 --logout
Logging out of session [sid: 1, target: iqn.2014-08.com.example:t1, portal: 10.71.57.19,3260]
Logout of [sid: 1, target: iqn.2014-08.com.example:t1, portal: 10.71.57.19,3260] successful.

Most of the time this results in the above errors (BUG() in iput() and NULL
pointer dereference in gfs2_logd()).

I think this may be happening because gfs2_logd does a withdraw which does iput()
on the journal inode which evicts it. It then tries to reload it and fails
(because of IO errors?). When gfs2_put_super() is called, it does iput() on the
same inode again and hits the BUG().

Any ideas on this?

Thanks,
Ross

