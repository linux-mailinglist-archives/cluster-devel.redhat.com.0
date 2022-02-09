Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E92974AFD41
	for <lists+cluster-devel@lfdr.de>; Wed,  9 Feb 2022 20:25:27 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-58-C3A6jw0FNe-IvKAJLHktKw-1; Wed, 09 Feb 2022 14:25:23 -0500
X-MC-Unique: C3A6jw0FNe-IvKAJLHktKw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1CC121F2DE;
	Wed,  9 Feb 2022 19:25:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FBAF196F2;
	Wed,  9 Feb 2022 19:25:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EC48D1809CB9;
	Wed,  9 Feb 2022 19:25:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 219JPDPF001137 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 9 Feb 2022 14:25:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3F3FD40CFD31; Wed,  9 Feb 2022 19:25:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A98340CFD27
	for <cluster-devel@redhat.com>; Wed,  9 Feb 2022 19:25:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 21D6B3804086
	for <cluster-devel@redhat.com>; Wed,  9 Feb 2022 19:25:13 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-479-In0BwriOPCa7Vrm0QUD7zw-1; Wed, 09 Feb 2022 14:25:11 -0500
X-MC-Unique: In0BwriOPCa7Vrm0QUD7zw-1
Received: by mail-wm1-f46.google.com with SMTP id
	l67-20020a1c2546000000b00353951c3f62so2359724wml.5
	for <cluster-devel@redhat.com>; Wed, 09 Feb 2022 11:25:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=9X6kiHxpGEazzvkQHp8JnSwgUsJv8D0X/1igB1bJ0oM=;
	b=NuPkYBPDuiBaCbCvXVyVVEWxWonxMWwT2wQYFgsBF+EfslbETWSnrsrOrZG6C/Tag+
	U5IAoTqh1HZBp+XbfaTX7xFlDyS29LniT32hpRVQsCb+wosVCyE7x6Q+B1cQr//fjLeU
	Z/JFdiOkOeLvKhCBpHQoM6BKiiotv9Oyit/68aDVeZFhdZisk/EyyjN8c2Or4jNxIhaR
	hM0PC4GiABSUhpg6bLR+jyZIQvXUc9AJcpS0+6x7BoNKl49l1XSdT4EIijg9fbdHprbn
	5tUi4Nz4wHL+kkEc0jFU5pynJXN6LsYPgl/sOKl1qnCKovOrS5AYRZp6u6MWfv7pSlUD
	BX7g==
X-Gm-Message-State: AOAM5314aAoEYxixn+QloiZUKCLnjOIC59g0roZFyZu3CsNMbiIXG6Mr
	EIJVe9AibuvPrtURik/XU0v+qg==
X-Google-Smtp-Source: ABdhPJxCUh4sor/h3+HFTKlhR6E08fCeHYcKOJMGBMEAnXI+4nuwI1jwNHyvV7w8k63ICgSJT0jJAg==
X-Received: by 2002:a7b:c38b:: with SMTP id s11mr3995713wmj.8.1644434709820;
	Wed, 09 Feb 2022 11:25:09 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net.
	[86.27.177.88])
	by smtp.gmail.com with ESMTPSA id z5sm6993811wmp.10.2022.02.09.11.25.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 09 Feb 2022 11:25:09 -0800 (PST)
Date: Wed, 9 Feb 2022 19:25:05 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <YgQVEVVOfPH/f2jQ@google.com>
References: <20220209085243.3136536-1-lee.jones@linaro.org>
	<20220209150904.GA22025@lst.de> <YgPk9HhIeFM43b/a@google.com>
	<YgQSCoD5j9KbpHsA@casper.infradead.org>
MIME-Version: 1.0
In-Reply-To: <YgQSCoD5j9KbpHsA@casper.infradead.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Damien Le Moal <damien.lemoal@wdc.com>,
	linux-ext4@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
	"Darrick J . Wong" <darrick.wong@oracle.com>,
	linux-kernel@vger.kernel.org, Stable <stable@vger.kernel.org>,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Ritesh Harjani <riteshh@linux.ibm.com>,
	Johannes Thumshirn <jth@kernel.org>, Christoph Hellwig <hch@lst.de>,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, 09 Feb 2022, Matthew Wilcox wrote:

> On Wed, Feb 09, 2022 at 03:59:48PM +0000, Lee Jones wrote:
> > On Wed, 09 Feb 2022, Christoph Hellwig wrote:
> > 
> > > On Wed, Feb 09, 2022 at 08:52:43AM +0000, Lee Jones wrote:
> > > > This reverts commit 60263d5889e6dc5987dc51b801be4955ff2e4aa7.
> > > > 
> > > > Reverting since this commit opens a potential avenue for abuse.
> > > > 
> > > > The C-reproducer and more information can be found at the link below.
> > > > 
> > > > With this patch applied, I can no longer get the repro to trigger.
> > > 
> > > Well, maybe you should actually debug and try to understand what is
> > > going on before blindly reverting random commits.
> > 
> > That is not a reasonable suggestion.
> > 
> > Requesting that someone becomes an area expert on a huge and complex
> > subject such as file systems (various) in order to fix your broken
> > code is not rational.
> 
> Sending a patch to revert a change you don't understand is also
> not rational.  If you've bisected it to a single change -- great!
> If reverting the patch still fixes the bug -- also great!  But
> don't send a patch when you clearly don't understand what the
> patch did.

If reverting isn't the correct thing to do here, please consider this
as a bug report.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog

