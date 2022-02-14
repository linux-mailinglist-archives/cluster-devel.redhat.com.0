Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A51C44B52E2
	for <lists+cluster-devel@lfdr.de>; Mon, 14 Feb 2022 15:12:15 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-14-KE2geTK2P-eW1yie-lnKKg-1; Mon, 14 Feb 2022 09:12:10 -0500
X-MC-Unique: KE2geTK2P-eW1yie-lnKKg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47F0B344B1;
	Mon, 14 Feb 2022 14:12:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 06F6370D3F;
	Mon, 14 Feb 2022 14:12:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 70A651809CB9;
	Mon, 14 Feb 2022 14:12:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
	[10.11.54.8])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21EEC2eI012240 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 14 Feb 2022 09:12:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6734CC5094B; Mon, 14 Feb 2022 14:12:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 629E9C50941
	for <cluster-devel@redhat.com>; Mon, 14 Feb 2022 14:12:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4873310665A0
	for <cluster-devel@redhat.com>; Mon, 14 Feb 2022 14:12:02 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-637-9Hd4VIyzOCS5-rQnLsTV6Q-1; Mon, 14 Feb 2022 09:11:50 -0500
X-MC-Unique: 9Hd4VIyzOCS5-rQnLsTV6Q-1
Received: by mail-wm1-f49.google.com with SMTP id
	q198-20020a1ca7cf000000b0037bb52545c6so11734391wme.1
	for <cluster-devel@redhat.com>; Mon, 14 Feb 2022 06:11:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=3Is2B0GtPj2dMI82ExWIaXz6ThN1J8/FAH1EK+krjOg=;
	b=Yf+jphox5DYrTAIMMYNvnUqPdDTtdezGcRwsn0ANDesbfRGr2bmw+t4QO9Z/koYWKb
	CC9E1rT16v/muZc2zf3jdDnC8cg8voYVbGJ5/+ko7dYvpEljGugMC2Z4aLr9cMEff+bj
	esVoxSaQLhZ9/q/gtReYqhT8svKd9FzEU+jvetHRW2QNpBSFbT37wt8P9sA9GwB6i6sm
	kc6fgocub4IdTLEj/qONYUzi7Ofe74Y+cBShbtaubiB9K/lMKXwUjaUnArQkWeR6hmQb
	yLVPhADo3o3WpepyspfN1wiI5cp/+92Pkt+j3y/u/X8IrSFEJfTTIzEIKSZiPC7jiChw
	HWaQ==
X-Gm-Message-State: AOAM531wgCKlB+O8XNky7N86zl9aeZ2TVLyvuNcjh6LhS/ExMxc6U4Cf
	4sgS/YcoaQNaqq626M/t7jy26w==
X-Google-Smtp-Source: ABdhPJycc2AeNgDLeMcPq709jDg3r69PS0m8CwcCpEyvCW2mDtnrAFFDMHyQuEReiKG5356uJWPxRg==
X-Received: by 2002:a1c:a104:: with SMTP id k4mr11292346wme.68.1644847909280; 
	Mon, 14 Feb 2022 06:11:49 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net.
	[86.27.177.88]) by smtp.gmail.com with ESMTPSA id
	j6sm17636672wrt.70.2022.02.14.06.11.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 14 Feb 2022 06:11:48 -0800 (PST)
Date: Mon, 14 Feb 2022 14:11:46 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <YgpjIustbUeRqvR2@google.com>
References: <20220209085243.3136536-1-lee.jones@linaro.org>
	<20220210045911.GF8338@magnolia> <YgTl2Lm9Vk50WNSj@google.com>
	<YgZ0lyr91jw6JaHg@casper.infradead.org>
	<YgowAl01rq5A8Sil@google.com> <20220214134206.GA29930@lst.de>
MIME-Version: 1.0
In-Reply-To: <20220214134206.GA29930@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Damien Le Moal <damien.lemoal@wdc.com>,
	linux-ext4@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
	"Darrick J . Wong" <darrick.wong@oracle.com>,
	"Darrick J. Wong" <djwong@kernel.org>,
	linux-kernel@vger.kernel.org, Stable <stable@vger.kernel.org>,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Ritesh Harjani <riteshh@linux.ibm.com>,
	Matthew Wilcox <willy@infradead.org>, Johannes Thumshirn <jth@kernel.org>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, 14 Feb 2022, Christoph Hellwig wrote:

> Let me repeat myself:  Please send a proper bug report to the linux-ext4
> list.  Thanks!

Okay, so it is valid.  Question answered, thanks.

I still believe that I am unqualified to attempt to debug this myself.

In order to do so, I'll at least require some guidance from you SMEs.

Please bear with me while I clear my desk - lots on currently.

Bug report to follow.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog

