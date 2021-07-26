Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 43F493D5C3C
	for <lists+cluster-devel@lfdr.de>; Mon, 26 Jul 2021 16:56:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1627311368;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Z+XO8He0MnOT3uB6EB4BJXHFkpBewYX22E+E+nyzSDc=;
	b=iQLyqCjXmaQSGm0c4LZtc9SXLWeyc0FV1f1UNhvGVv9KB7V6WlC4jUDSG9s4CEBUwd6b73
	VHkJ448A42PwrWHBUl433dM5R4doUfOkKf6GXYTfc1klUN4P0LBNVmn1QUhCsl+oq2EPPW
	7f/tksmG0evOmMBNNqs9K7BHoJGc27Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-8b5W2silN46Uz6-dI3D8Dg-1; Mon, 26 Jul 2021 10:56:07 -0400
X-MC-Unique: 8b5W2silN46Uz6-dI3D8Dg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02FB3100F762;
	Mon, 26 Jul 2021 14:56:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D7F4E5C1CF;
	Mon, 26 Jul 2021 14:56:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AD8D04BB7B;
	Mon, 26 Jul 2021 14:56:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16QEntg8007279 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 26 Jul 2021 10:49:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 54FE42156737; Mon, 26 Jul 2021 14:49:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DE58215672D
	for <cluster-devel@redhat.com>; Mon, 26 Jul 2021 14:49:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9BF3B101A54C
	for <cluster-devel@redhat.com>; Mon, 26 Jul 2021 14:49:48 +0000 (UTC)
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
	[209.85.166.198]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-333-p9xQWRn8PmqZwGHTdxCbYQ-1; Mon, 26 Jul 2021 10:49:47 -0400
X-MC-Unique: p9xQWRn8PmqZwGHTdxCbYQ-1
Received: by mail-il1-f198.google.com with SMTP id
	o6-20020a056e020926b0290221b4e37e75so783085ilt.21
	for <cluster-devel@redhat.com>; Mon, 26 Jul 2021 07:49:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Z+XO8He0MnOT3uB6EB4BJXHFkpBewYX22E+E+nyzSDc=;
	b=jgbJ0h2dESISliRil1hJT+94qtBJD6Cm1ZJCb6wJjqd+Hb+Y8mtldEEZA55VqackWN
	fZiNkryJaIGbISePospsBXewtOCHE0lqoqZK1FHHS21CENWqN0G8tX6hgEbFyw5Pnq9H
	r+UVwTJE7JRFQc5plLhobbZwKdwDE+XNF7HyqCVMiXQy18+Dk5haZ0HjozjQz6p9dSib
	3dLLPboDUErN6U/P2VH0fZIw8HpBzjg8urjk0+tuRVVhjDKcY/zP2vcAlEC94XtWrNLc
	mUOrcukxOVVWYNDrRDqdCj+jFSogPd4MxwQcYQuw/3gZirOHfHzFzFzaS0J8rVtEyWtY
	BVjA==
X-Gm-Message-State: AOAM532s49icaGFwR4DKlStEFy8jM4dZF29A3ilUfCsBLa82H6Rdqhpq
	wp9V1a3e7C78XT8kgQp0u+VuV6oKWmThjmOm+hBKJ92EE3oocJiQbiM3RRCwpKWNdZIkAZ/vqYw
	ue1oHuyaJYtVwpNsf94tE1/1BN6/p4BtChDFa8IgnXl4B0aimZIkpUKOsqW2o5xXtbMEe8MT8Xg
	==
X-Received: by 2002:a92:cf0c:: with SMTP id c12mr13240251ilo.56.1627310986190; 
	Mon, 26 Jul 2021 07:49:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzS6jmPjfM3uGbLeMMVlkDv9mUsVx/eYH62XG0yr/9du4HFfbxDwIr2ns2FMJT2yM1dlhCfVA==
X-Received: by 2002:a92:cf0c:: with SMTP id c12mr13240235ilo.56.1627310985959; 
	Mon, 26 Jul 2021 07:49:45 -0700 (PDT)
Received: from [172.16.0.19] (209-212-39-192.brainerd.net. [209.212.39.192])
	by smtp.gmail.com with ESMTPSA id h1sm43272ioz.22.2021.07.26.07.49.45
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 26 Jul 2021 07:49:45 -0700 (PDT)
To: Christoph Hellwig <hch@lst.de>, Andreas Gruenbacher <agruenba@redhat.com>
References: <20210726140058.GA9206@lst.de>
From: Bob Peterson <rpeterso@redhat.com>
Message-ID: <b52eaed9-d85b-9d1a-758e-33287ed7b901@redhat.com>
Date: Mon, 26 Jul 2021 09:49:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210726140058.GA9206@lst.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] gfs2 hang in xfstests generic/361
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 7/26/21 9:00 AM, Christoph Hellwig wrote:
> I noticed this hang while testing the iomap_iter series on gfs2,
> but it also reproduces on 5.14-rc3.  This is running locally with
> "-O -p lock_nolock":
> 
> generic/361 files ... [ 1479.222703] run fstests generic/361 at 2021-07-26 13:57:10
(snip)
> [ 1491.744459] gfs2: fsid=loop0.0: fatal: I/O error
> [ 1491.744459]   block = 17192
> [ 1491.744459]   function = gfs2_ail1_empty_one, file = fs/gfs2/log.c, line = 323
> [ 1491.747491] gfs2: fsid=loop0.0: fatal: I/O error(s)
> [ 1491.748477] gfs2: fsid=loop0.0: about to withdraw this file system
> [ 1491.752284]
> [ 1491.752587] =============================
> [ 1491.753403] [ BUG: Invalid wait context ]
> [ 1491.754122] 5.14.0-rc2+ #47 Not tainted
> [ 1491.754860] -----------------------------
> [ 1491.755563] kworker/2:1H/1975 is trying to lock:
> [ 1491.756370] ffff8881048d0888 (&wq->mutex){+.+.}-{3:3}, at: flush_workqueue+0xc9/0x5f0
> [ 1491.757736] other info that might help us debug this:
> [ 1491.758622] context-{4:4}
> [ 1491.759087] 4 locks held by kworker/2:1H/1975:
> [ 1491.759863]  #0: ffff888101717b38 ((wq_completion)glock_workqueue){+.+.}-{0:0}, at: p0
> [ 1491.761623]  #1: ffffc900040dfe78
> ((work_completion)(&(&gl->gl_work)->work)){+.+.}-{00
> [ 1491.763528]  #2: ffff88811ce6b000 (&sdp->sd_log_flush_lock){++++}-{3:3}, at: gfs2_log0
> [ 1491.765284]  #3: ffff88811ce6ae28 (&sdp->sd_log_lock){+.+.}-{2:2}, at: gfs2_flush_rev0
> [ 1491.767064] stack backtrace:
> [ 1491.767629] CPU: 2 PID: 1975 Comm: kworker/2:1H Not tainted 5.14.0-rc2+ #47
> [ 1491.769000] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.14.0-2 04/04
> [ 1491.770641] Workqueue: glock_workqueue glock_work_func
> [ 1491.771635] Call Trace:
> [ 1491.772101]  dump_stack_lvl+0x45/0x59
> [ 1491.772777]  __lock_acquire.cold+0x2a2/0x2be
> [ 1491.773529]  ? save_trace+0x3e/0x380
> [ 1491.774160]  lock_acquire+0xc9/0x2f0
> [ 1491.774815]  ? flush_workqueue+0xc9/0x5f0
> [ 1491.775521]  __mutex_lock+0x75/0x870
> [ 1491.776151]  ? flush_workqueue+0xc9/0x5f0
> [ 1491.776856]  ? flush_workqueue+0xc9/0x5f0
> [ 1491.777560]  ? lock_release+0x13c/0x2e0
> [ 1491.778234]  flush_workqueue+0xc9/0x5f0
> [ 1491.779012]  gfs2_make_fs_ro+0x2b/0x2b0
> [ 1491.779687]  gfs2_withdraw.cold+0x16f/0x4bd
> [ 1491.780424]  ? gfs2_freeze_lock+0x24/0x60
> [ 1491.781129]  gfs2_ail1_empty+0x305/0x310
> [ 1491.781821]  gfs2_flush_revokes+0x29/0x40
> [ 1491.782526]  revoke_lo_before_commit+0x12/0x1c0
> [ 1491.783324]  gfs2_log_flush+0x337/0xb00
> [ 1491.784001]  inode_go_sync+0x8e/0x200
> [ 1491.784663]  do_xmote+0xd2/0x380
> [ 1491.785268]  glock_work_func+0x57/0x130
> [ 1491.785944]  process_one_work+0x237/0x560

Hi Christoph,

Thanks. I've run generic/361 many times on many recent branches and I've
never seen this before. For example, this is from last Friday:

generic/361 8s ...  13s

Still, I can see what's going on and it's not a recent problem. This is
basically a problem with our withdraw sequence from February 2020.
(patch 601ef0d52e96) I'll try to fix it as soon as I get a chance.

Regards,

Bob Peterson

