Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 823483D65DC
	for <lists+cluster-devel@lfdr.de>; Mon, 26 Jul 2021 19:36:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1627320963;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kF9uW+Z39OnrXaKsMvUdPFjgW0r3ojrwg4ApVXPgH14=;
	b=Hzs0QWcGjzBe+BPGNtV4YHFaUm+xkNMuAsgFI1mi+AzpLu7R0GKviySa8Xx0E1xllo4VuV
	T7CFLRN/1OnXdTjuimCN7F6dKoe1E5OIZU4edGAN1+zzhMmdPu8xSXABHGdBiqJu+rDeHo
	MmxmIb/ShoLdI3gV9uLLv8CbvCHnzIg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-te2mFDolNNmI4FmNK-4sAQ-1; Mon, 26 Jul 2021 13:36:02 -0400
X-MC-Unique: te2mFDolNNmI4FmNK-4sAQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0BC5DF8A5;
	Mon, 26 Jul 2021 17:35:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B367A5C1CF;
	Mon, 26 Jul 2021 17:35:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6E2A7180BAB1;
	Mon, 26 Jul 2021 17:35:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16QHZlle025546 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 26 Jul 2021 13:35:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 44D01217B416; Mon, 26 Jul 2021 17:35:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E75B217B41C
	for <cluster-devel@redhat.com>; Mon, 26 Jul 2021 17:35:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 71F3B1066683
	for <cluster-devel@redhat.com>; Mon, 26 Jul 2021 17:35:38 +0000 (UTC)
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
	[209.85.166.199]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-464-Mzjh8OhsP32aA2WXNy60gw-1; Mon, 26 Jul 2021 13:35:37 -0400
X-MC-Unique: Mzjh8OhsP32aA2WXNy60gw-1
Received: by mail-il1-f199.google.com with SMTP id
	v18-20020a056e020f92b02901ff388acf98so5366310ilo.2
	for <cluster-devel@redhat.com>; Mon, 26 Jul 2021 10:35:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=kF9uW+Z39OnrXaKsMvUdPFjgW0r3ojrwg4ApVXPgH14=;
	b=o5ptO81sWXC5cHcnP5UE62rpdu1kULjbnzaMcSuUHEBRHBqvOONkYfCUjrcU6S0CKo
	ocoFA1ozKjmitcIcSx1qqJvPQ6Z68F7Ive/e04m/6iUWM2YbpHZuawLgkLvthfU7DZD6
	GBWWBL7cV/L3gRz5JhBcUPbKXUL8MAGtOFXVFtOQFhVEMBJbZhvB0RXBjGV45C8VNADh
	TRJbVFL1EvTuW4Xemcrw9XFlcJSJsheVqAOT1S97VMKhdhT2A0Q58K5siQIW+t6UYCja
	hOF2uczSQlU9Z042hGHH3ThiYmwh2v7N0GLoWjRCh/Sk68Ru02rvMdyAD1b1LnU5bFKD
	BU7g==
X-Gm-Message-State: AOAM532Ao3AxLGnS0q2TO0QDr2+ZOLmTWiQS/LjTNsXvAKSpi6byL1wT
	X1LsPqerKyw/aXHJhzPQfR6skxd4sYqJeDUG54N88bOGnmaIzMMv1zdM1MM/G54drC91hv+v4ta
	WXICjEixuU8XWl+Rpt/+KwvCO3jXMZXfTZOdIng6z4QsTAY196SbXsFUdxRwZzkyJltc3SmwLpA
	==
X-Received: by 2002:a05:6638:24c3:: with SMTP id
	y3mr17516029jat.10.1627320935968; 
	Mon, 26 Jul 2021 10:35:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhwvHQ7FxHiU7Ydyv4ytBuvsPj4uhaqrV3Y7VO3iK9UeaKoaK1lWm/eGWAvxTxSiZIA2c0+g==
X-Received: by 2002:a05:6638:24c3:: with SMTP id
	y3mr17516014jat.10.1627320935731; 
	Mon, 26 Jul 2021 10:35:35 -0700 (PDT)
Received: from [172.16.0.19] (209-212-39-192.brainerd.net. [209.212.39.192])
	by smtp.gmail.com with ESMTPSA id f9sm216538ile.38.2021.07.26.10.35.34
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 26 Jul 2021 10:35:35 -0700 (PDT)
To: Christoph Hellwig <hch@lst.de>, Andreas Gruenbacher <agruenba@redhat.com>
References: <20210726140058.GA9206@lst.de>
From: Bob Peterson <rpeterso@redhat.com>
Message-ID: <2c552824-47bd-a757-3314-1d539908815a@redhat.com>
Date: Mon, 26 Jul 2021 12:35:34 -0500
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
(snip)
> generic/361 files ... [ 1479.222703] run fstests generic/361 at 2021-07-26 13:57:10
(snip)
> [ 1491.752587] =============================
> [ 1491.753403] [ BUG: Invalid wait context ]
> [ 1491.754122] 5.14.0-rc2+ #47 Not tainted
> [ 1491.754860] -----------------------------
> [ 1491.755563] kworker/2:1H/1975 is trying to lock:

Hi again Christoph,

Apparently the reason I haven't been seeing this problem myself is
because I've been testing code in an experimental branch in linux-gfs2,
and one of my other patches already fixed the problem. I just pushed my
experimental branch to linux-gfs2/for-next.next4 and the patch that
fixes it is 631e950b2eeb ("gfs2: fix deadlock in gfs2_ail1_empty
withdraw"). Perhaps you can cherry-pick that patch (and others if 
warranted) into your test branch and see if it behaves itself?

Regards,

Bob Peterson

