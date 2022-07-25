Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F0A5806E6
	for <lists+cluster-devel@lfdr.de>; Mon, 25 Jul 2022 23:41:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658785290;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iezcoauBjm3eFRZAxsMkX8ABOzYWxWzYpMePyAltlQQ=;
	b=VetASCFtRBHEIFUnXoxd+2wFTV12XXzyV4jrHL8V1pOe2tQV8jR6Ms/+3t5dyrDLnxfWd2
	gms1kbA4zpb3XwoxAkgv30aXYX+Wsi6OWXodkmggp60qQk1maD2Nm3ZpAt2I/g4H7a0wMs
	ULoSZlJtxrIHNDWeigKODoOU6HixRgc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-416-mh3NtBs6Os25gOJOI4_P_Q-1; Mon, 25 Jul 2022 17:41:26 -0400
X-MC-Unique: mh3NtBs6Os25gOJOI4_P_Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C9C4101A54E;
	Mon, 25 Jul 2022 21:41:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DD503400E577;
	Mon, 25 Jul 2022 21:41:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D94421945D8B;
	Mon, 25 Jul 2022 21:41:19 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 66BF61945D86 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 25 Jul 2022 21:41:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 48AB9C27D95; Mon, 25 Jul 2022 21:41:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 44CDAC15D67
 for <cluster-devel@redhat.com>; Mon, 25 Jul 2022 21:41:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2C5A5811E75
 for <cluster-devel@redhat.com>; Mon, 25 Jul 2022 21:41:18 +0000 (UTC)
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-19-bOZZqvYJNlG0hDrhtJSazw-1; Mon, 25 Jul 2022 17:41:16 -0400
X-MC-Unique: bOZZqvYJNlG0hDrhtJSazw-1
Received: by mail-qv1-f69.google.com with SMTP id
 li6-20020a0562145e0600b004744011ed4dso3395584qvb.22
 for <cluster-devel@redhat.com>; Mon, 25 Jul 2022 14:41:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iezcoauBjm3eFRZAxsMkX8ABOzYWxWzYpMePyAltlQQ=;
 b=A8crKPKd/mfrUH1hPo8wAtOlpYIuNvB+gz0fRSvmcew+7SYFIMyRgm46fnQbd3D4RL
 oGz91ZVjvdtHsjFwINhGmBGTiUQaA0m70FIudxO7Y9mAxUhmkSd+eFBXuXzeIQiuqJ/2
 mwljOHXUrByOZ0gpi0CWoqtTyf0mjBn8M6BY/WMjFqdKhKf+vBtqhwvNozm7LhdWmP6y
 K11eyduF7jLFeN81ARkqMYzJBdA3lS/oDUHgvBolfj24n5kh80lPYeZQ7Ket41WISr+m
 1chfwswcMuXRZXZnD/unYiCkC4ximWwC0WwCBaMyGhGJNZ5la5MsII/FHAYxA1DT38IP
 seEg==
X-Gm-Message-State: AJIora/DgmMg92hbXywwkEEkz+YrTgxNBZPtXn4rJjM3sbK50hy5Sl6O
 OVfyo+5sXZolDGqyiXN8mreqZ+mnmZ7I4A0zDjzQB5sZiq2mfZZ7DTaDc1gOW97VsASyFVUtyCM
 rH+OG47OViG5yy6iznElB8XaHXgkiwq+Ennx1sg==
X-Received: by 2002:a0c:f58d:0:b0:474:48e:fc99 with SMTP id
 k13-20020a0cf58d000000b00474048efc99mr11989862qvm.2.1658785276000; 
 Mon, 25 Jul 2022 14:41:16 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tdPKES8mswmwSbImCkQhQkLdHJX3Dr41zU/flZ02Nfij0DMKLyF6PHlW0qfnXIFlYIrkSJOIjoODIGD3UK3no=
X-Received: by 2002:a0c:f58d:0:b0:474:48e:fc99 with SMTP id
 k13-20020a0cf58d000000b00474048efc99mr11989848qvm.2.1658785275786; Mon, 25
 Jul 2022 14:41:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220725195322.857226-1-aahringo@redhat.com>
 <20220725195322.857226-2-aahringo@redhat.com>
In-Reply-To: <20220725195322.857226-2-aahringo@redhat.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Mon, 25 Jul 2022 17:41:04 -0400
Message-ID: <CAK-6q+joxVt1D854jYRKTRjx_Bm8kPWqH+9Rma2Ke_TbkFEfEw@mail.gmail.com>
To: David Teigland <teigland@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: Re: [Cluster-devel] [PATCHv2 dlm/next 1/2] fs: dlm: fix race in
 lowcomms
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
Cc: cluster-devel <cluster-devel@redhat.com>, stable@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jul 25, 2022 at 3:53 PM Alexander Aring <aahringo@redhat.com> wrote=
:
>
> This patch fixes a race between queue_work() in
> _dlm_lowcomms_commit_msg() and srcu_read_unlock(). The queue_work() can
> take the final reference of a dlm_msg and so msg->idx can contain
> garbage which is signaled by the following warning:
>
> [  676.237050] ------------[ cut here ]------------
> [  676.237052] WARNING: CPU: 0 PID: 1060 at include/linux/srcu.h:189 dlm_=
lowcomms_commit_msg+0x41/0x50
> [  676.238945] Modules linked in: dlm_locktorture torture rpcsec_gss_krb5=
 intel_rapl_msr intel_rapl_common iTCO_wdt iTCO_vendor_support qxl kvm_inte=
l drm_ttm_helper vmw_vsock_virtio_transport kvm vmw_vsock_virtio_transport_=
common ttm irqbypass crc32_pclmul joydev crc32c_intel serio_raw drm_kms_hel=
per vsock virtio_scsi virtio_console virtio_balloon snd_pcm drm syscopyarea=
 sysfillrect sysimgblt snd_timer fb_sys_fops i2c_i801 lpc_ich snd i2c_smbus=
 soundcore pcspkr
> [  676.244227] CPU: 0 PID: 1060 Comm: lock_torture_wr Not tainted 5.19.0-=
rc3+ #1546
> [  676.245216] Hardware name: Red Hat KVM/RHEL-AV, BIOS 1.16.0-2.module+e=
l8.7.0+15506+033991b0 04/01/2014
> [  676.246460] RIP: 0010:dlm_lowcomms_commit_msg+0x41/0x50
> [  676.247132] Code: fe ff ff ff 75 24 48 c7 c6 bd 0f 49 bb 48 c7 c7 38 7=
c 01 bd e8 00 e7 ca ff 89 de 48 c7 c7 60 78 01 bd e8 42 3d cd ff 5b 5d c3 <=
0f> 0b eb d8 66 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 55 48
> [  676.249253] RSP: 0018:ffffa401c18ffc68 EFLAGS: 00010282
> [  676.249855] RAX: 0000000000000001 RBX: 00000000ffff8b76 RCX: 000000000=
0000006
> [  676.250713] RDX: 0000000000000000 RSI: ffffffffbccf3a10 RDI: ffffffffb=
cc7b62e
> [  676.251610] RBP: ffffa401c18ffc70 R08: 0000000000000001 R09: 000000000=
0000001
> [  676.252481] R10: 0000000000000001 R11: 0000000000000001 R12: 000000000=
0000005
> [  676.253421] R13: ffff8b76786ec370 R14: ffff8b76786ec370 R15: ffff8b767=
86ec480
> [  676.254257] FS:  0000000000000000(0000) GS:ffff8b7777800000(0000) knlG=
S:0000000000000000
> [  676.255239] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  676.255897] CR2: 00005590205d88b8 CR3: 000000017656c003 CR4: 000000000=
0770ee0
> [  676.256734] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 000000000=
0000000
> [  676.257567] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 000000000=
0000400
> [  676.258397] PKRU: 55555554
> [  676.258729] Call Trace:
> [  676.259063]  <TASK>
> [  676.259354]  dlm_midcomms_commit_mhandle+0xcc/0x110
> [  676.259964]  queue_bast+0x8b/0xb0
> [  676.260423]  grant_pending_locks+0x166/0x1b0
> [  676.261007]  _unlock_lock+0x75/0x90
> [  676.261469]  unlock_lock.isra.57+0x62/0xa0
> [  676.262009]  dlm_unlock+0x21e/0x330
> [  676.262457]  ? lock_torture_stats+0x80/0x80 [dlm_locktorture]
> [  676.263183]  torture_unlock+0x5a/0x90 [dlm_locktorture]
> [  676.263815]  ? preempt_count_sub+0xba/0x100
> [  676.264361]  ? complete+0x1d/0x60
> [  676.264777]  lock_torture_writer+0xb8/0x150 [dlm_locktorture]
> [  676.265555]  kthread+0x10a/0x130
> [  676.266007]  ? kthread_complete_and_exit+0x20/0x20
> [  676.266616]  ret_from_fork+0x22/0x30
> [  676.267097]  </TASK>
> [  676.267381] irq event stamp: 9579855
> [  676.267824] hardirqs last  enabled at (9579863): [<ffffffffbb14e6f8>] =
__up_console_sem+0x58/0x60
> [  676.268896] hardirqs last disabled at (9579872): [<ffffffffbb14e6dd>] =
__up_console_sem+0x3d/0x60
> [  676.270008] softirqs last  enabled at (9579798): [<ffffffffbc200349>] =
__do_softirq+0x349/0x4c7
> [  676.271438] softirqs last disabled at (9579897): [<ffffffffbb0d54c0>] =
irq_exit_rcu+0xb0/0xf0
> [  676.272796] ---[ end trace 0000000000000000 ]---
>
> I reproduced this warning with dlm_locktorture test which is currently
> not upstream. However this patch fix the issue by make a additional
> refcount between dlm_lowcomms_new_msg() and dlm_lowcomms_commit_msg().
> In case of the race the kref_put() in dlm_lowcomms_commit_msg() will be
> the final put.
>
> Signed-off-by: Alexander Aring <aahringo@redhat.com>

grml, now I forgot in this patch Cc: stable and fixes-tag. Will send v3. So=
rry.

- Alex

