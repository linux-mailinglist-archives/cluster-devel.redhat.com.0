Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3101E28F1D1
	for <lists+cluster-devel@lfdr.de>; Thu, 15 Oct 2020 14:06:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1602763572;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=HHV6QWEqJcekA2QNsKVWXxxrO06eCQczcIf1wiYw+qs=;
	b=OX2iEuDyQiMatvvne/dNvnQIKm9n1Zv2ZzX1WOo/2uOp0+z/wn172vDWO7f5Ie9nGeRZXk
	UtNMsJfItMv7HO+8TsBwWRM7xR50mRCJqR9X0Dwaa+r+A91arKNOdgUave12Pe8kDH8VnP
	kjCtHlvCMGcB3cah4zjgw50+O3OXM4c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-PjdytOfeNKSICVKuMDtcag-1; Thu, 15 Oct 2020 08:06:10 -0400
X-MC-Unique: PjdytOfeNKSICVKuMDtcag-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF2E01062721;
	Thu, 15 Oct 2020 12:06:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF3A876663;
	Thu, 15 Oct 2020 12:06:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CE6711832FC3;
	Thu, 15 Oct 2020 12:06:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09FC5rIE017087 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 15 Oct 2020 08:05:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CE4CC2166BA0; Thu, 15 Oct 2020 12:05:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C90D72166B28
	for <cluster-devel@redhat.com>; Thu, 15 Oct 2020 12:05:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C72F5805A22
	for <cluster-devel@redhat.com>; Thu, 15 Oct 2020 12:05:50 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
	[209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-339-ZPAxqWIoOeCfE7oEHdKMUg-1; Thu, 15 Oct 2020 08:05:49 -0400
X-MC-Unique: ZPAxqWIoOeCfE7oEHdKMUg-1
Received: by mail-wr1-f72.google.com with SMTP id x16so1747095wrg.7
	for <cluster-devel@redhat.com>; Thu, 15 Oct 2020 05:05:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HHV6QWEqJcekA2QNsKVWXxxrO06eCQczcIf1wiYw+qs=;
	b=RNTugxzs8mdzP54BwrIBhMkPv7nyC9GPQJD5eOg/aGmBQbPH29t/t0ZI67xDbKNmiH
	/V4nppMLUiSfnbDXjHweCBE9XIhNkk4AdiAAQVm7+vNgn9tFm1yo2FTsWP03Q/4i/RRc
	4adk18bdke3wdSQk+wfBtbJfSjoAIOjsa4CYnlkNPqb+84vn1dx3BCDk3TejlThinPDD
	QNtIYDbu7ac6YotvOHGbW5R8CXcpwWs2YSEx8y71GoZnWJYlZorE1lZa+wvNh16Bt4tp
	+AsKCBlp1JIM9z0tNUbIxCTdUgTKf7GQXMlyBw/pQrB5bpUw5TiRp4hAt6xnpzeJswtg
	Jm1g==
X-Gm-Message-State: AOAM533W7fSCwDCNW1SVD0xKydl2nIbv4Lc/YpETmA7br6ge9yVBRMo7
	E8q20rQV3B/GCI2agDQTqzqLbD8X9USVOjdy56hq5t2bAa8XA6B0RMBipxe4tBPT3X3nj9iXbtS
	5v/O1vl04JuTf3DDVBlBirzDSr/oPabxTDW7YMA==
X-Received: by 2002:adf:fd07:: with SMTP id e7mr3793041wrr.377.1602763547596; 
	Thu, 15 Oct 2020 05:05:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzj/pvib2RGxCfa3lDvKDlw8VNm9iQUHlsQW2Xd4BgjTxPPgv+TIYHCRrNbrWejlbfKubaVoP2q5L7icImEfzw=
X-Received: by 2002:adf:fd07:: with SMTP id e7mr3793018wrr.377.1602763547327; 
	Thu, 15 Oct 2020 05:05:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200925034625.56517-1-adas@redhat.com>
In-Reply-To: <20200925034625.56517-1-adas@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 15 Oct 2020 14:05:35 +0200
Message-ID: <CAHc6FU6c1MAUTvUgQiY1q54jR2=agFR5p_P-xKOt0QMN=-Y_8g@mail.gmail.com>
To: Abhi Das <adas@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [PATCH v2 0/3] gfs2: local statfs improvements
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi Abhi,

On Fri, Sep 25, 2020 at 5:46 AM Abhi Das <adas@redhat.com> wrote:
> This patchset allows gfs2 to sync statfs info from the journal to the
> master statfs file during a log flush or during recovery. We still
> write to the local statfs file to allow older versions to recover the
> statfs info of newer kernels with this patchset.

With these patches, I'm running into the following bug with xfstest generic/034:

[  461.763402] run fstests generic/034 at 2020-10-15 13:53:39
[  465.985914] gfs2: fsid=dm-2: Trying to join cluster "lock_nolock", "dm-2"
[  465.988445] gfs2: fsid=dm-2: Now mounting FS...
[  466.008824] gfs2: fsid=dm-2.0: journal 0 mapped with 1 extents in 0ms
[  466.011108] gfs2: fsid=dm-2.0: jid=0, already locked for use
[  466.013110] gfs2: fsid=dm-2.0: jid=0: Looking at journal...
[  466.044558] gfs2: fsid=dm-2.0: jid=0: Journal head lookup took 31ms
[  466.046846] gfs2: fsid=dm-2.0: jid=0: Done
[  466.048361] gfs2: fsid=dm-2.0: first mount done, others may mount
[  466.504743] gfs2: fsid=dm-2: Trying to join cluster "lock_nolock", "dm-2"
[  466.507442] gfs2: fsid=dm-2: Now mounting FS...
[  466.529999] gfs2: fsid=dm-2.0: journal 0 mapped with 1 extents in 0ms
[  466.532387] gfs2: fsid=dm-2.0: jid=0, already locked for use
[  466.534460] gfs2: fsid=dm-2.0: jid=0: Looking at journal...
[  466.566238] gfs2: fsid=dm-2.0: jid=0: Journal head lookup took 31ms
[  466.568601] gfs2: fsid=dm-2.0: jid=0: Acquiring the transaction lock...
[  466.571733] gfs2: fsid=dm-2.0: jid=0: Replaying journal...0x720 to 0x72a
[  466.576946] gfs2: fsid=dm-2.0: jid=0: Replayed 2 of 5 blocks
[  466.579126] gfs2: fsid=dm-2.0: jid=0: Found 3 revoke tags
[  466.581231] ------------[ cut here ]------------
[  466.582941] kernel BUG at fs/gfs2/recovery.c:309!
[  466.584694] invalid opcode: 0000 [#1] SMP PTI
[  466.586255] CPU: 5 PID: 37 Comm: kworker/5:0 Kdump: loaded Tainted:
G        W         5.9.0+ #435
[  466.589389] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009),
BIOS 1.13.0-2.fc32 04/01/2014
[  466.592443] Workqueue: gfs_recovery gfs2_recover_func [gfs2]
[  466.594451] RIP: 0010:update_statfs_inode.isra.7+0x35/0x17e [gfs2]
[  466.596607] Code: 41 56 41 55 41 54 53 48 83 ec 30 65 48 8b 04 25
28 00 00 00 48 89 45 d0 31 c0 48 8b 47 28 48 8b 98 60 06 00 00 48 85
c9 75 02 <0f> 0b 49 89 cc 49 89 d7 48 8b 91 f0 03 00 00 49 89 f6 48 8d
4d b0
[  466.603068] RSP: 0018:ffffb97b401dfc08 EFLAGS: 00010246
[  466.604899] RAX: ffff9143979fc000 RBX: ffff914395bb4000 RCX: 0000000000000000
[  466.607423] RDX: ffffb97b401dfcf0 RSI: ffff914376c1cf80 RDI: ffff914375fb6a50
[  466.609907] RBP: ffffb97b401dfc60 R08: ffff914395bb4000 R09: 0000000000000001
[  466.612402] R10: 00000000bdc64e7c R11: 00000000ab4460f4 R12: ffff914376c1cf00
[  466.614850] R13: ffff914395bb4000 R14: 0000006c91d3605f R15: ffff914376c1cf80
[  466.617346] FS:  0000000000000000(0000) GS:ffff91439f680000(0000)
knlGS:0000000000000000
[  466.620155] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  466.622161] CR2: 00007ff80367cf1e CR3: 0000000825712003 CR4: 0000000000370ee0
[  466.624674] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[  466.627145] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[  466.629628] Call Trace:
[  466.630532]  ? gfs2_revoke_clean+0x6d/0x90 [gfs2]
[  466.632206]  gfs2_recover_func.cold.13+0x8fe/0x912 [gfs2]
[  466.634122]  ? lock_acquire+0xcb/0x3a0
[  466.635454]  ? process_one_work+0x1ad/0x560
[  466.636949]  ? gfs2_recover_func.cold.13+0x26c/0x912 [gfs2]
[  466.638910]  process_one_work+0x22c/0x560
[  466.640366]  ? process_one_work+0x22c/0x560
[  466.641846]  worker_thread+0x37/0x390
[  466.643143]  ? process_one_work+0x560/0x560
[  466.644626]  kthread+0x13d/0x160
[  466.645774]  ? kthread_park+0x90/0x90
[  466.647049]  ret_from_fork+0x22/0x30
[  466.648234] Modules linked in: dm_flakey gfs2 dlm nft_fib_inet
nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv6
nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack rfkill
nf_defrag_ipv6 nf_defrag_ipv4 ip6_tables nft_compat ip_set nf_tables
nfnetlink intel_rapl_msr intel_rapl_common kvm_intel kvm irqbypass
crct10dif_pclmul snd_hda_codec_generic crc32_pclmul ledtrig_audio
snd_hda_intel snd_intel_dspcfg ghash_clmulni_intel iTCO_wdt
iTCO_vendor_support snd_hda_codec rapl snd_hda_core snd_hwdep i2c_i801
snd_pcm joydev pcspkr i2c_smbus lpc_ich snd_timer virtio_balloon snd
qxl soundcore drm_ttm_helper ttm drm_kms_helper cec drm xfs libcrc32c
crc32c_intel serio_raw virtio_net net_failover virtio_blk
virtio_console failover qemu_fw_cfg
[  466.667870] ---[ end trace 2cdb0867c48ce2a7 ]---

That's the BUG_ON(!inode) in update_statfs_inode. I've pushed the
kernel I've been using to
https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git/log/?h=local-statfs-improvements;
that's for-next + v5.9 + iomap-5.10-merge-2 from the xfs tree.

Thanks,
Andreas

