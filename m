Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 596BF21EDEF
	for <lists+cluster-devel@lfdr.de>; Tue, 14 Jul 2020 12:26:52 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-1A28f24yPUa-J4PIebuqKA-1; Tue, 14 Jul 2020 06:26:49 -0400
X-MC-Unique: 1A28f24yPUa-J4PIebuqKA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4BCDC19253C0;
	Tue, 14 Jul 2020 10:26:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CCF2860C87;
	Tue, 14 Jul 2020 10:26:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2057994F05;
	Tue, 14 Jul 2020 10:26:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06CBafdi016641 for <cluster-devel@listman.util.phx.redhat.com>;
	Sun, 12 Jul 2020 07:36:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B7F89D9298; Sun, 12 Jul 2020 11:36:41 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B33DBD960D
	for <cluster-devel@redhat.com>; Sun, 12 Jul 2020 11:36:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 441B7800399
	for <cluster-devel@redhat.com>; Sun, 12 Jul 2020 11:36:37 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-334-jHMWE00TNiaT1rI1LKO_3Q-1; Sun, 12 Jul 2020 07:36:34 -0400
X-MC-Unique: jHMWE00TNiaT1rI1LKO_3Q-1
Received: by mail-wr1-f67.google.com with SMTP id f18so10129700wrs.0
	for <cluster-devel@redhat.com>; Sun, 12 Jul 2020 04:36:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=5A9cDnFjTG3NBzPmqHsPL3YmbPK4apFGGEKOIxq7+1E=;
	b=NVUce7VAD0Rxizx6zJyIXMdK98lLDp5m9x7YkBEMwF0i9Z+iFbXjTR4+pZjdBPRz1M
	PaEQq/L4ScORZHzoX27KtqB17BXrk3nTZeU2/G9QEovaLjP6nV2cv0YSPX0KLiRWF8EV
	13R9Lvb+CZmSTDUHdw0oF0rAA6BF46PA3ywz2YVOTKT3kq5HC8H2URo8GihblrV9IvFu
	HFzMpU0jT6HULaoD8Pa6vA19Cj4smQsDH2Hx3m+1eEXrKbQxK1njKmLuoU0iVfQfCxr5
	73jppUCsGcTVHEnVEgOKLubQzSohybLOvjirIXK7p4bIBs7WL5QX11TSG5BaBK7LDfTH
	SXTg==
X-Gm-Message-State: AOAM531Iglh5/uxqTLsxiDdEgUN8WKd6VYyAGt3XKCPGPnzYprKXIgV3
	zNqLVXiM81bzxHkZ6evGcQI4fw==
X-Google-Smtp-Source: ABdhPJz33AclGjgkKPm9J3Ofni7d342G+PScmj88XhlgW6hBgx7woi/nEA1w/wuw9KvF7wt1x0wiRg==
X-Received: by 2002:adf:f889:: with SMTP id u9mr82733150wrp.149.1594553793471; 
	Sun, 12 Jul 2020 04:36:33 -0700 (PDT)
Received: from [10.0.0.1] (system.cloudius-systems.com. [199.203.229.89])
	by smtp.gmail.com with ESMTPSA id m2sm7020970wmg.0.2020.07.12.04.36.29
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sun, 12 Jul 2020 04:36:32 -0700 (PDT)
To: Dave Chinner <david@fromorbit.com>, Matthew Wilcox <willy@infradead.org>
References: <20200629192353.20841-1-rgoldwyn@suse.de>
	<20200629192353.20841-3-rgoldwyn@suse.de>
	<20200701075310.GB29884@lst.de>
	<20200707124346.xnr5gtcysuzehejq@fiona>
	<20200707125705.GK25523@casper.infradead.org>
	<20200707130030.GA13870@lst.de>
	<20200708065127.GM2005@dread.disaster.area>
	<20200708135437.GP25523@casper.infradead.org>
	<20200709022527.GQ2005@dread.disaster.area>
From: Avi Kivity <avi@scylladb.com>
Organization: ScyllaDB
Message-ID: <f86a687a-29bf-ef9c-844c-4354de9a65bb@scylladb.com>
Date: Sun, 12 Jul 2020 14:36:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200709022527.GQ2005@dread.disaster.area>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Tue, 14 Jul 2020 06:26:40 -0400
Cc: linux-xfs@vger.kernel.org, fdmanana@gmail.com, darrick.wong@oracle.com,
	Goldwyn Rodrigues <rgoldwyn@suse.de>, dsterba@suse.cz,
	cluster-devel@redhat.com, linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
	linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] always fall back to buffered I/O after
 invalidation failures,
 was: Re: [PATCH 2/6] iomap: IOMAP_DIO_RWF_NO_STALE_PAGECACHE return if page
 invalidation fails
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 09/07/2020 05.25, Dave Chinner wrote:
>
>> Nobody's proposing changing Direct I/O to exclusively work through the
>> pagecache.  The proposal is to behave less weirdly when there's already
>> data in the pagecache.
> No, the proposal it to make direct IO behave *less
> deterministically* if there is data in the page cache.
>
> e.g. Instead of having a predicatable submission CPU overhead and
> read latency of 100us for your data, this proposal makes the claim
> that it is always better to burn 10x the IO submission CPU for a
> single IO to copy the data and give that specific IO 10x lower
> latency than it is to submit 10 async IOs to keep the IO pipeline
> full.
>
> What it fails to take into account is that in spending that CPU time
> to copy the data, we haven't submitted 10 other IOs and so the
> actual in-flight IO for the application has decreased. If
> performance comes from keeping the IO pipeline as close to 100% full
> as possible, then copying the data out of the page cache will cause
> performance regressions.
>
> i.e. Hit 5 page cache pages in 5 IOs in a row, and the IO queue
> depth craters because we've only fulfilled 5 complete IOs instead of
> submitting 50 entire IOs. This is the hidden cost of synchronous IO
> via CPU data copying vs async IO via hardware offload, and if we
> take that into account we must look at future hardware performance
> trends to determine if this cost is going to increase or decrease in
> future.
>
> That is: CPUs are not getting faster anytime soon. IO subsystems are
> still deep in the "performance doubles every 2 years" part of the
> technology curve (pcie 3.0->4.0 just happened, 4->5 is a year away,
> 5->6 is 3-4 years away, etc). Hence our reality is that we are deep
> within a performance trend curve that tells us synchronous CPU
> operations are not getting faster, but IO bandwidth and IOPS are
> going to increase massively over the next 5-10 years. Hence putting
> (already expensive) synchronous CPU operations in the asynchronous
> zero-data-touch IO fast path is -exactly the wrong direction to be
> moving-.
>
> This is simple math. The gap between IO latency and bandwidth and
> CPU addressable memory latency and bandwidth is closing all the
> time, and the closer that gap gets the less sense it makes to use
> CPU addressable memory for buffering syscall based read and write
> IO. We are not quite yet at the cross-over point, but we really
> aren't that far from it.
>
>

My use-case supports this. The application uses AIO+DIO, but backup may 
bring pages into page cache. For me, it is best to ignore page cache (as 
long as it's clean, which it is for backup) and serve from disk as usual.


