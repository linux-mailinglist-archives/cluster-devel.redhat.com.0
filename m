Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E3A913F21B3
	for <lists+cluster-devel@lfdr.de>; Thu, 19 Aug 2021 22:35:57 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-BfFgBk96N3OyHGozy_kdYA-1; Thu, 19 Aug 2021 16:35:55 -0400
X-MC-Unique: BfFgBk96N3OyHGozy_kdYA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A661F1026200;
	Thu, 19 Aug 2021 20:35:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 937761002F12;
	Thu, 19 Aug 2021 20:35:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 45B04181A0F7;
	Thu, 19 Aug 2021 20:35:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17JKZnVG017538 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 19 Aug 2021 16:35:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D7CAC10336E9; Thu, 19 Aug 2021 20:35:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D346E117C2FF
	for <cluster-devel@redhat.com>; Thu, 19 Aug 2021 20:35:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 47CE9185A794
	for <cluster-devel@redhat.com>; Thu, 19 Aug 2021 20:35:42 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
	[209.85.216.46]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-201-HX2gtzXePcm8CYYNlTaOBw-1; Thu, 19 Aug 2021 16:35:40 -0400
X-MC-Unique: HX2gtzXePcm8CYYNlTaOBw-1
Received: by mail-pj1-f46.google.com with SMTP id
	om1-20020a17090b3a8100b0017941c44ce4so12193746pjb.3
	for <cluster-devel@redhat.com>; Thu, 19 Aug 2021 13:35:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2lq1/9dzMwse8hgj+nLsRtNNVHy5Ra8cI/pFGIqflik=;
	b=psNO3jM9BKQCAsdyD7TvFFRc6PxJsqOQA7FFBw5PgIfnc5ak2h3ABTbWOwC4kNAa55
	5AXCjh4QkaCQT0FuTRgEkHnD+huY/epKbcHKf+44emTRHBKcdEuB+bVAWdshqwdL5MjH
	nblav3LMjqnmdIeAV3tTJZzj+AwT5uzJwJdkUcgj8jX42Df8WO9Lu5HoTsqWbrde1Vhs
	quaHt1ZhDwV71Oa0iluy1BtlGHk/s3XzerdjHZR3RNz6hgFWlg0xbl7ZYRcD61ow6DDs
	7R3n44Erl1mvcxZbfcAPSOSFLjWGZmiNycM8z1R1UELa2T/8cwzKt0cZjW/BxtdH91V0
	jmeQ==
X-Gm-Message-State: AOAM530hGFaIfakgAULeDvIspZDGE8k+06wz5TauyqAdHPw23W+sktS7
	XAldSHOFdm79lbv2ycZwlpDl5BDUV3wepO3ZrzxEyg==
X-Google-Smtp-Source: ABdhPJxSp6xtccEDJJJY44GOHyKJniTxZ6vHD+7V+PQJrY3uECT6oRKOpiFktsbnpDGqKIO/PuciS0G+rhFl437R2uk=
X-Received: by 2002:a17:90a:708c:: with SMTP id
	g12mr628765pjk.13.1629405339323; 
	Thu, 19 Aug 2021 13:35:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210809061244.1196573-1-hch@lst.de>
	<20210809061244.1196573-8-hch@lst.de>
In-Reply-To: <20210809061244.1196573-8-hch@lst.de>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 19 Aug 2021 13:35:28 -0700
Message-ID: <CAPcyv4iRUYcZAMgiDLXDW-bRZxeRzAnWOgNJ4UL==CQX83_jxQ@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: Linux NVDIMM <nvdimm@lists.linux.dev>, cluster-devel@redhat.com,
	"Darrick J. Wong" <djwong@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Shiyang Ruan <ruansy.fnst@fujitsu.com>,
	linux-xfs <linux-xfs@vger.kernel.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	linux-btrfs <linux-btrfs@vger.kernel.org>
Subject: Re: [Cluster-devel] [PATCH 07/30] fsdax: mark the iomap argument to
 dax_iomap_sector as const
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
Content-Type: text/plain; charset="UTF-8"

On Sun, Aug 8, 2021 at 11:19 PM Christoph Hellwig <hch@lst.de> wrote:

I'd prefer a non-empty changelog that said something like:

"In preparation for iomap_iter() update iomap helpers to treat the
iomap argument as read-only."

Just to leave a breadcrumb for the motivation for this change, but no
major worry if you don't respin for that.

>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Darrick J. Wong <djwong@kernel.org>

Otherwise, LGTM

Reviewed-by: Dan Williams <dan.j.williams@intel.com>

