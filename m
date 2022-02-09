Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7131C4AF520
	for <lists+cluster-devel@lfdr.de>; Wed,  9 Feb 2022 16:23:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1644420213;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=HWJxSwYp7jtZ92shaLhTfEcqyJ4FcqxLKxSHScXMFmA=;
	b=VgM3QZVEmd/qFfh3AJypDUoGqPsS8BgsnEGfrxj35GRgY14A+4hPZZqz+S+YIdAih4sCEQ
	28mjz6Is/NNbZQDrPFm9zpF3hSXuJuQxou7ADSPi+w1wGgJhCaq0d/QPjBY21zTM4jinpZ
	mCGtfOP/bDCJZa/+53swPN9bG1ZyBVE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-322-c01Go3GEMj6FNIxBcksATA-1; Wed, 09 Feb 2022 10:23:30 -0500
X-MC-Unique: c01Go3GEMj6FNIxBcksATA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D4CA814404;
	Wed,  9 Feb 2022 15:23:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A41B66ABB6;
	Wed,  9 Feb 2022 15:23:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 337381809CB8;
	Wed,  9 Feb 2022 15:23:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
	[10.11.54.8])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 219FKOMH009229 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 9 Feb 2022 10:20:24 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 752F1C080AE; Wed,  9 Feb 2022 15:20:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 71DE2C080A7
	for <cluster-devel@redhat.com>; Wed,  9 Feb 2022 15:20:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 57F3F802A6A
	for <cluster-devel@redhat.com>; Wed,  9 Feb 2022 15:20:24 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
	[209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-42-6fDbetEBN0KZnuHizi6ESg-1; Wed, 09 Feb 2022 10:20:22 -0500
X-MC-Unique: 6fDbetEBN0KZnuHizi6ESg-1
Received: by mail-wr1-f69.google.com with SMTP id
	b8-20020adfc748000000b001e333edbe40so1233548wrh.6
	for <cluster-devel@redhat.com>; Wed, 09 Feb 2022 07:20:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HWJxSwYp7jtZ92shaLhTfEcqyJ4FcqxLKxSHScXMFmA=;
	b=OuS33d81JVn9hCe0LWZVgW3OHSE3yhHYG9YU8C6wz7JfdaZYlfG5HfTwvoAb7qMsE5
	WjnjmzrTbfG03l5Cfs0W4Rp9s3fgL1+/mdo7dIjZInpX2o9VWOpEt+yYTzTI3X9ctHkH
	EwZy1mAc0vrcyj+I3MO9AXEfeDIC50VWDO4aJ7c8EjKI+j2ajHGE03yb2zgsdZrTz2Pr
	3CudtaUqhg6KdbOaTWptrKStyzhyP0H5u0hBuj+dz+bcsOEMY+XlOS8jmVt862+kPFgX
	w1wMamOcAiG68nkRpv/KTYyCEEhrOyKYFAWkC9NhbiG2qFUEqSXgQOzwGkVyc1j5ncAd
	1MkQ==
X-Gm-Message-State: AOAM530DXegOU6Tt9DnNckB1OjmWEAOlU8vUZ8lqE5OHKfQoV+pbcoba
	zHmZbNEMnsSorSlLD+lEaDrLqiRHbxL9P/rYUOWLLF6SIxOabXABslN5pK1Fwu0OoYNYxIai5Nj
	NXilE53gGt2mJp9a22Lw+t2PIRL/ADBFYH2b4xQ==
X-Received: by 2002:a1c:2942:: with SMTP id p63mr2494650wmp.75.1644420021707; 
	Wed, 09 Feb 2022 07:20:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzBIOqCE7cDbpGvT5TmCSizl7rrPw18L3EY0Uy8onixaMONTzYS0XvUHUkxcZEdMAG886y96+4xK4BB/NuuR5w=
X-Received: by 2002:a1c:2942:: with SMTP id p63mr2494623wmp.75.1644420021540; 
	Wed, 09 Feb 2022 07:20:21 -0800 (PST)
MIME-Version: 1.0
References: <20220209085243.3136536-1-lee.jones@linaro.org>
	<20220209150904.GA22025@lst.de>
In-Reply-To: <20220209150904.GA22025@lst.de>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 9 Feb 2022 16:20:10 +0100
Message-ID: <CAHc6FU5e4GaQTfh6Z2_2vhcgxY+dbwUBOgazrXB3XW4=DRpLHQ@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>,
	Damien Le Moal <damien.lemoal@wdc.com>,
	linux-ext4 <linux-ext4@vger.kernel.org>, Theodore Ts'o <tytso@mit.edu>,
	"Darrick J . Wong" <darrick.wong@oracle.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Stable <stable@vger.kernel.org>, linux-xfs@vger.kernel.org,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Ritesh Harjani <riteshh@linux.ibm.com>,
	Johannes Thumshirn <jth@kernel.org>, Lee Jones <lee.jones@linaro.org>,
	Goldwyn Rodrigues <rgoldwyn@suse.com>,
	syzbot+0ed9f769264276638893@syzkaller.appspotmail.com
Subject: Re: [Cluster-devel] [PATCH 1/1] Revert "iomap: fall back to
 buffered writes for invalidation failures"
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
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 9, 2022 at 4:09 PM Christoph Hellwig <hch@lst.de> wrote:
> On Wed, Feb 09, 2022 at 08:52:43AM +0000, Lee Jones wrote:
> > This reverts commit 60263d5889e6dc5987dc51b801be4955ff2e4aa7.
> >
> > Reverting since this commit opens a potential avenue for abuse.
> >
> > The C-reproducer and more information can be found at the link below.

This reproducer seems to be working fine on gfs2, but the locking in
gfs2 differs hugely from that of other filesystems.

> > With this patch applied, I can no longer get the repro to trigger.
>
> Well, maybe you should actually debug and try to understand what is
> going on before blindly reverting random commits.

Andreas

