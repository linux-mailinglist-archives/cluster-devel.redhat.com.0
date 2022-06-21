Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D4E55302C
	for <lists+cluster-devel@lfdr.de>; Tue, 21 Jun 2022 12:53:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655808828;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=Q5Qbi0ZHDRtCL5EC+yh1qKuUlkjaTp80mTKtOltNF1I=;
	b=X0PEPWMN874BBsknRM+tSq7xe4b2/OZubJ9+gbrftbl1X1krx3k9BRo3Z5O3frD1M0P+Qk
	pAPveC7BlmWxRarf93o0DhmqwTswMfgzKV29xaqYHSzL06o8RUcys8T1kqsmcHH95LfHmT
	F/X3DXeeH36Y3TLscpFFC7KI93H9lI0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-329-BRik8SPWPlK4l76iV23n4w-1; Tue, 21 Jun 2022 06:53:44 -0400
X-MC-Unique: BRik8SPWPlK4l76iV23n4w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D6FAB801756;
	Tue, 21 Jun 2022 10:53:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0D27840C1289;
	Tue, 21 Jun 2022 10:53:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CB9E0194704C;
	Tue, 21 Jun 2022 10:53:41 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B59DD1947041 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 21 Jun 2022 10:53:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1603818EA8; Tue, 21 Jun 2022 10:53:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 11FB518EA3
 for <cluster-devel@redhat.com>; Tue, 21 Jun 2022 10:53:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EABF13C01D87
 for <cluster-devel@redhat.com>; Tue, 21 Jun 2022 10:53:29 +0000 (UTC)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-482-iWJ2-gCXOwqfvzm05Qxd-g-1; Tue, 21 Jun 2022 06:53:28 -0400
X-MC-Unique: iWJ2-gCXOwqfvzm05Qxd-g-1
Received: by mail-wm1-f70.google.com with SMTP id
 l3-20020a05600c1d0300b0039c7efa2526so6225160wms.3
 for <cluster-devel@redhat.com>; Tue, 21 Jun 2022 03:53:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q5Qbi0ZHDRtCL5EC+yh1qKuUlkjaTp80mTKtOltNF1I=;
 b=FQnCJNys6RAv1ZfpNvpnAIURbDmlS9CrfRVXb9+aSg9nnl0oD8zHhlylCQiSQabMK+
 IAEzRjzmZSPoOuU2gqu+9rgRCxNID96Ye5h0IjDKtkrqN/Ltsv1YVzupaX7kTyimyCwN
 rTEplHXq6zpgbifW4XfWo9S/Wwwf3mW6rmmQsr1u/BwvWzek/KMzFO4wQTU9cCFH1R1b
 OellaUgsqBpUfWaTah9qqnPy7CiXtiWLeRPHUhSSRBnTdIOFvm28NcPD97N72ZnZb+T3
 FeCeCreqCuQR9KSnaWjwqhWfWwWUq+IcfqXntgEU6hP6EkJSDemdSTWg5Mk7fR9u/l0S
 iWYw==
X-Gm-Message-State: AJIora+bDOvd5n419zqIjJ8LzpdMevqyroN4mBy5jkaP2+osyc6rhhm3
 AtB1WpUuudIRPxAtn18oI6rPs/aM5k1j6Aq6vS9dW4XhoGBIJeGPfFn/4HskZIWFzqjW8ATTRqP
 YcbymfPxZXfVoGqwrZXT7lZKyB6SL5AshC3CAoQ==
X-Received: by 2002:a05:600c:4982:b0:39c:3c0d:437c with SMTP id
 h2-20020a05600c498200b0039c3c0d437cmr29103765wmp.38.1655808807018; 
 Tue, 21 Jun 2022 03:53:27 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uuIvCHLfP+HSuhSI03DOYmMXCS6J0e7Gfua0B7S5cJNMDerFoOrC10rmYKDyVX3aj7R1vgSdlOOkLdDOkb1TM=
X-Received: by 2002:a05:600c:4982:b0:39c:3c0d:437c with SMTP id
 h2-20020a05600c498200b0039c3c0d437cmr29103750wmp.38.1655808806792; Tue, 21
 Jun 2022 03:53:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220621091420.GC3256@lst.de>
In-Reply-To: <20220621091420.GC3256@lst.de>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 21 Jun 2022 12:53:15 +0200
Message-ID: <CAHc6FU43bqdDccUF56ngQRPiSahBkd0ti4U0WZA2_0-F9yu44w@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: Re: [Cluster-devel] Mounting lock_nolock file systems?
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
Cc: cluster-devel <cluster-devel@redhat.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 21, 2022 at 11:14 AM Christoph Hellwig <hch@lst.de> wrote:
>
> I'm felling a little stupid, but in the past after a
>
> mkfs.gfs2  -O -p lock_nolock
>
> I could just mount the created file system locally.
>
> On current mainline that does not seem to work any more, what am I
> missing?
>
> Here is the output from the mount attempt:
>
> oot@testvm:~# mount /dev/vdb /mnt/
> [  154.745017] gfs2: fsid=vdb: Trying to join cluster "lock_nolock", "vdb"
> [  154.745024] gfs2: fsid=vdb: Now mounting FS (format 1801)...
> [  154.782279] gfs2: fsid=vdb.0: journal 0 mapped with 1 extents in 0ms
> [  154.784878] gfs2: fsid=vdb.0: jid=0, already locked for use
> [  154.784885] gfs2: fsid=vdb.0: jid=0: Looking at journal...
> [  154.787474] gfs2: fsid=vdb.0: jid=0: Journal head lookup took 2ms
> [  154.787482] gfs2: fsid=vdb.0: jid=0: Acquiring the transaction lock...
> [  154.787513] gfs2: fsid=vdb.0: jid=0: Replaying journal...0x0 to 0x0
> [  154.787522] gfs2: fsid=vdb.0: jid=0: Replayed 0 of 0 blocks
> [  154.787525] gfs2: fsid=vdb.0: jid=0: Found 0 revoke tags
> [  154.788116] gfs2: fsid=vdb.0: jid=0: Journal replayed in 3ms [jlck:0ms, jhead:2ms, tl]
> [  154.788239] gfs2: fsid=vdb.0: jid=0: Done
> [  154.789896] gfs2: fsid=vdb.0: first mount done, others may mount
> [  154.802688] gfs2: fsid=vdb.0: fatal: filesystem consistency error - function = gfs2_m5
> [  154.802700] gfs2: fsid=vdb.0: about to withdraw this file system
> [  185.894949] gfs2: fsid=vdb.0: Journal recovery skipped for jid 0 until next mount.
> [  185.894975] gfs2: fsid=vdb.0: Glock dequeues delayed: 0
> [  185.895202] gfs2: fsid=vdb.0: File system withdrawn
> [  185.895220] CPU: 1 PID: 2777 Comm: mount Not tainted 5.19.0-rc3+ #1713
> [  185.895229] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.14.0-2 04/04
> [  185.895239] Call Trace:
> [  185.895247]  <TASK>
> [  185.895251]  dump_stack_lvl+0x45/0x5a
> [  185.895276]  gfs2_withdraw.cold+0xdb/0x507
> [  185.895305]  gfs2_fill_super+0xb5a/0xbe0
> [  185.895312]  ? gfs2_fill_super+0x771/0xbe0
> [  185.895319]  ? gfs2_fill_super+0xa22/0xbe0
> [  185.895325]  ? gfs2_reconfigure+0x3c0/0x3c0
> [  185.895330]  get_tree_bdev+0x169/0x270
> [  185.895341]  gfs2_get_tree+0x19/0x80
> [  185.895346]  vfs_get_tree+0x20/0xb0
> [  185.895352]  path_mount+0x2b1/0xa70
> [  185.895362]  __x64_sys_mount+0xfe/0x140
> [  185.895370]  do_syscall_64+0x3b/0x90
> [  185.895378]  entry_SYSCALL_64_after_hwframe+0x46/0xb0
> [  185.895388] RIP: 0033:0x7fd8ba7269ea
> [  185.895404] Code: 48 8b 0d a9 f4 0b 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 08
> [  185.895410] RSP: 002b:00007ffea6838018 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
> [  185.895419] RAX: ffffffffffffffda RBX: 00007fd8ba849264 RCX: 00007fd8ba7269ea
> [  185.895423] RDX: 000055669b2724e0 RSI: 000055669b26dc50 RDI: 000055669b26b370
> [  185.895427] RBP: 000055669b26b140 R08: 0000000000000000 R09: 00007fd8ba7e6be0
> [  185.895431] R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
> [  185.895434] R13: 000055669b26b370 R14: 000055669b2724e0 R15: 000055669b26b140
> [  185.895443]  </TASK>
> [  185.895461] gfs2: fsid=vdb.0: can't make FS RW: -5

Hmm, that's supposed to work, and it's working here with kernel
5.19.0-rc3 and multiple versions of mkfs.gfs2. I'm getting slightly
different output from the kernel, though:

gfs2: fsid=vdc: Trying to join cluster "lock_nolock", "vdc"
gfs2: fsid=vdc: Now mounting FS (format 1801)...
gfs2: fsid=vdc.0: journal 0 mapped with 1 extents in 0ms
gfs2: fsid=vdc.0: jid=0, already locked for use
gfs2: fsid=vdc.0: jid=0: Looking at journal...
gfs2: fsid=vdc.0: jid=0: Journal head lookup took 81ms
gfs2: fsid=vdc.0: jid=0: Done
gfs2: fsid=vdc.0: first mount done, others may mount

Is the caching behavior of your vdb device configured weirdly?

Thanks,
Andreas

