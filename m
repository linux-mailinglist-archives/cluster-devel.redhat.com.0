Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8724B5390
	for <lists+cluster-devel@lfdr.de>; Mon, 14 Feb 2022 15:43:36 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-jZixq46wP4GDlgd-rRVszQ-1; Mon, 14 Feb 2022 09:43:32 -0500
X-MC-Unique: jZixq46wP4GDlgd-rRVszQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 681CC835BC5;
	Mon, 14 Feb 2022 14:43:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 216D67DE49;
	Mon, 14 Feb 2022 14:43:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A9C534BB7C;
	Mon, 14 Feb 2022 14:43:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
	[10.11.54.10])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21EEhQDm015596 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 14 Feb 2022 09:43:26 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4BC7E5361F4; Mon, 14 Feb 2022 14:43:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 47DE25361D6
	for <cluster-devel@redhat.com>; Mon, 14 Feb 2022 14:43:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2ECC11C07CC5
	for <cluster-devel@redhat.com>; Mon, 14 Feb 2022 14:43:26 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-561-sbnI2BEFM4Kg87qBc-8VMw-1; Mon, 14 Feb 2022 09:43:24 -0500
X-MC-Unique: sbnI2BEFM4Kg87qBc-8VMw-1
Received: by mail-wr1-f50.google.com with SMTP id p9so6704175wra.12
	for <cluster-devel@redhat.com>; Mon, 14 Feb 2022 06:43:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=8k2aplyYI1OYSbtp/sgTQSaIuXBRyilQhTxzdkcz5oM=;
	b=3ZacfE3fOJA8qqCm3dWTYzv+aBkv4KTnQwD/RkqRfhz3DVELslXqRW/eBvD9wDJG7T
	MKnWffmYxb7fhCSfN30LaQ6j6Ytt5358okldBqgKrjNWIYQOKJ8K4VAtKBSEUtErwKK8
	XW6H8+jVlmhYzr08XPe1gO+CRoR79VkQwIBxbVVemtNr2xij+XRmAJoRfXv5maiPQx/U
	ve+Ru6rMNzofOY3zcH2fb8kWwa0YtsZqV3cc2NR/ZB7EvPZSAAbqJoqr/lLIbddRRaKm
	sbIfp/DdMEJkt4G399meEUd4NqjSXdyPE7wuR3sIE5gmpm3ZfbyR9j8dcQdQUJyHBH1U
	b8mw==
X-Gm-Message-State: AOAM531BiZ2fZh4Rpf3/15ilGuAkccpeBBrcXl1QoorJTmurEyjHkJob
	TWIBpzfDeninJrKhtP54E1DZxA==
X-Google-Smtp-Source: ABdhPJw7yRUYoEyGu9ey4dIfTWZqAtG97B1/NFiN85MQVuWJ6su5QCeF3PBi//ZfG99hTeOE+wDSOA==
X-Received: by 2002:a5d:52c9:: with SMTP id r9mr11422010wrv.449.1644849803276; 
	Mon, 14 Feb 2022 06:43:23 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net.
	[86.27.177.88]) by smtp.gmail.com with ESMTPSA id
	o16sm12358972wmc.25.2022.02.14.06.43.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 14 Feb 2022 06:43:22 -0800 (PST)
Date: Mon, 14 Feb 2022 14:43:20 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <YgpqiG7fvX7pHEHO@google.com>
References: <20220209085243.3136536-1-lee.jones@linaro.org>
	<20220210045911.GF8338@magnolia> <YgTl2Lm9Vk50WNSj@google.com>
	<YgZ0lyr91jw6JaHg@casper.infradead.org>
	<YgowAl01rq5A8Sil@google.com> <20220214134206.GA29930@lst.de>
	<YgpjIustbUeRqvR2@google.com>
	<YgpmN/R7jAf97PBU@casper.infradead.org>
MIME-Version: 1.0
In-Reply-To: <YgpmN/R7jAf97PBU@casper.infradead.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Damien Le Moal <damien.lemoal@wdc.com>,
	linux-ext4@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
	"Darrick J . Wong" <darrick.wong@oracle.com>,
	"Darrick J. Wong" <djwong@kernel.org>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, 14 Feb 2022, Matthew Wilcox wrote:
> On Mon, Feb 14, 2022 at 02:11:46PM +0000, Lee Jones wrote:
> > On Mon, 14 Feb 2022, Christoph Hellwig wrote:
> > 
> > > Let me repeat myself:  Please send a proper bug report to the linux-ext4
> > > list.  Thanks!
> > 
> > Okay, so it is valid.  Question answered, thanks.
> > 
> > I still believe that I am unqualified to attempt to debug this myself.
> 
> Nobody's asking you to debug it yourself.

Not meaning to drag this out any longer than is absolutely necessary,
but that's exactly what I was asked to do.

I fully appreciate how complex this subsystem is and am aware of my
inadequacy in the area.

> instead of wasting everybody's time.

That was never the intention.

> We're asking you to file a clear bug report

No problem.  Will comply.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog

