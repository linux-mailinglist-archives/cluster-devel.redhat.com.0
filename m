Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F064AF5E9
	for <lists+cluster-devel@lfdr.de>; Wed,  9 Feb 2022 17:00:07 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-404-AsYUB3e-NA65VAxSCDTA-g-1; Wed, 09 Feb 2022 11:00:05 -0500
X-MC-Unique: AsYUB3e-NA65VAxSCDTA-g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B853C1091DA2;
	Wed,  9 Feb 2022 16:00:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D475F106C0D9;
	Wed,  9 Feb 2022 16:00:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8FAC51809CB8;
	Wed,  9 Feb 2022 15:59:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 219FxunY012033 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 9 Feb 2022 10:59:56 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1CD0F76CD; Wed,  9 Feb 2022 15:59:56 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 18B1276CC
	for <cluster-devel@redhat.com>; Wed,  9 Feb 2022 15:59:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 15ACF1161A60
	for <cluster-devel@redhat.com>; Wed,  9 Feb 2022 15:59:53 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-495-NqHx1FfsM7ODannetZ4PvQ-2; Wed, 09 Feb 2022 10:59:51 -0500
X-MC-Unique: NqHx1FfsM7ODannetZ4PvQ-2
Received: by mail-wr1-f48.google.com with SMTP id i14so4809580wrc.10
	for <cluster-devel@redhat.com>; Wed, 09 Feb 2022 07:59:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=Wf8pBHPnIbwBS8l1ga7IlePPb2NVs+dEhjuVljUBPL0=;
	b=IZmhyNPG+dxE6DtCfh9kQ8EHs89kb5ACYDtyq532f97w8DDeo3z7GMYjmwR1PDk+m6
	Xn6gYwjBgacVuny7BTZPBQovyIqc7CKbTHpJj6iYraoB2c8Qcq3DaZpNVwxp7nRKJSaq
	IrdfOKI2MUcllN0C6F3tGh8zpnd3tDCY92g6kkKYKa9wujgXQp7o71qR/5cCXQU3vSRr
	UaXrhLj3G0mDQQ46f3ulY5ZzDz+aG4qmYB7UuBXKK5z077X8huiyuom+Pr5vLUHVLbX8
	bGNk3u7nFQQqmfICUE0YI85odOCsUKvd2wztmnfvzF0+1TdjBXVR83wPOzULls1QYP3M
	WhBA==
X-Gm-Message-State: AOAM532a99A5Do06H2DcJaou78bzn/0EZ8Yf3MFMROod+sWpPqjvKrnH
	kFpBp2nuDFzZHziQqpYaExGy9Q==
X-Google-Smtp-Source: ABdhPJzrsU/yGaq1wonWpTsPZOGFI2x3Kw84cs8UYaEe/84fhhkIxX9wA9KdK4C49JCW0SYDnFQlaw==
X-Received: by 2002:a05:6000:1548:: with SMTP id
	8mr2519928wry.504.1644422390765; 
	Wed, 09 Feb 2022 07:59:50 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net.
	[86.27.177.88])
	by smtp.gmail.com with ESMTPSA id g22sm5098170wmh.7.2022.02.09.07.59.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 09 Feb 2022 07:59:50 -0800 (PST)
Date: Wed, 9 Feb 2022 15:59:48 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <YgPk9HhIeFM43b/a@google.com>
References: <20220209085243.3136536-1-lee.jones@linaro.org>
	<20220209150904.GA22025@lst.de>
MIME-Version: 1.0
In-Reply-To: <20220209150904.GA22025@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Damien Le Moal <damien.lemoal@wdc.com>,
	linux-ext4@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
	"Darrick J . Wong" <darrick.wong@oracle.com>,
	linux-kernel@vger.kernel.org, Stable <stable@vger.kernel.org>,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Ritesh Harjani <riteshh@linux.ibm.com>,
	Johannes Thumshirn <jth@kernel.org>, Goldwyn Rodrigues <rgoldwyn@suse.com>,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, 09 Feb 2022, Christoph Hellwig wrote:

> On Wed, Feb 09, 2022 at 08:52:43AM +0000, Lee Jones wrote:
> > This reverts commit 60263d5889e6dc5987dc51b801be4955ff2e4aa7.
> > 
> > Reverting since this commit opens a potential avenue for abuse.
> > 
> > The C-reproducer and more information can be found at the link below.
> > 
> > With this patch applied, I can no longer get the repro to trigger.
> 
> Well, maybe you should actually debug and try to understand what is
> going on before blindly reverting random commits.

That is not a reasonable suggestion.

Requesting that someone becomes an area expert on a huge and complex
subject such as file systems (various) in order to fix your broken
code is not rational.

If you'd like to use the PoC provided as a basis to test your own
solution, then go right ahead.  However, as it stands this API should
be considered to contain security risk and should be patched as
quickly as can be mustered.  Reversion of the offending commit seems
to be the fastest method to achieve that currently.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog

