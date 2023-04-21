Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB9D6EA603
	for <lists+cluster-devel@lfdr.de>; Fri, 21 Apr 2023 10:40:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682066416;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=iCQQOrDHvv7muofgTvhggno9gmpvYe5WVwBD+zXre78=;
	b=epabmmhBwf9s7XeV1+W8c6KXqULUh47RmM6ix6q2R8S1wDFlea/beaAyWPZy9NXxgC9fPy
	ItL4NOHYOT/KF0z05ffVyWdeIPFT+J6Byl2c94DOCr6ZJ+nRgl0rC57ZQVHeRFdDXsQm/z
	PcPOErX0KWJiU98G0OiftpigqJoKu6M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-417-782ZTQ8AP9C-dgwx_fQoWg-1; Fri, 21 Apr 2023 04:40:11 -0400
X-MC-Unique: 782ZTQ8AP9C-dgwx_fQoWg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6440785C069;
	Fri, 21 Apr 2023 08:40:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 85F15140EBF4;
	Fri, 21 Apr 2023 08:40:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 254721946A47;
	Fri, 21 Apr 2023 08:40:09 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 413E719466DF for <cluster-devel@listman.corp.redhat.com>;
 Fri, 21 Apr 2023 06:58:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 197E52026D16; Fri, 21 Apr 2023 06:57:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 129F72026D25
 for <cluster-devel@redhat.com>; Fri, 21 Apr 2023 06:57:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E86E7101A555
 for <cluster-devel@redhat.com>; Fri, 21 Apr 2023 06:57:58 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-hOJzvXopNJusIjR5wjDPcA-2; Fri, 21 Apr 2023 02:57:56 -0400
X-MC-Unique: hOJzvXopNJusIjR5wjDPcA-2
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-63d4595d60fso12425908b3a.0
 for <cluster-devel@redhat.com>; Thu, 20 Apr 2023 23:57:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682060276; x=1684652276;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iCQQOrDHvv7muofgTvhggno9gmpvYe5WVwBD+zXre78=;
 b=AJUq0MM2NzbeFrcMraq8VEG0IsBH+Aa4gZtcj03+stJlH0RqhEwrxyMKcyZy9yB+C8
 NQKC77VfFAJ82zGtF7M8hsKk6JxS50d/J+jWZoPvEFv7H8Hsi9OfmVs4pW8MrK3jUnqX
 2do1zwqCGZMf97qrsW667TGF6FSK8Y7VMEp0AZfViDeU57xN1Boy93YPaHZXdayz7oZB
 E84azvQx1SlyQfOTTOPxQmlMBg6izuCVq55Ky/zKi6TZmM0mUo+oAXUZxvBMBMkre6qj
 Vkpjgq5gV3LCwxoU46IDvq6ARvw+5ttTliBc+L9zDTCVvhNGjBcw0p4o0yzPCa13CI/8
 KuMQ==
X-Gm-Message-State: AAQBX9fuYDSncssccMYFb++vd6/nDWvuelJVbEio20Qd30PN69+UffWB
 BWtlzhUcYM5smzUbi380dsZFxg==
X-Google-Smtp-Source: AKy350ZEEP/PrU7kYgyyZkKivdaMPHUVf5WGz+Wiu1WQ8mlkUVfjfkCNB7ZnxyH4DOCp4JsT1PbWNg==
X-Received: by 2002:aa7:8554:0:b0:63d:40bb:a88b with SMTP id
 y20-20020aa78554000000b0063d40bba88bmr8194787pfn.14.1682060275718; 
 Thu, 20 Apr 2023 23:57:55 -0700 (PDT)
Received: from google.com (KD124209188001.ppp-bb.dion.ne.jp. [124.209.188.1])
 by smtp.gmail.com with ESMTPSA id
 136-20020a63008e000000b0051806da5cd6sm2038374pga.60.2023.04.20.23.57.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 23:57:54 -0700 (PDT)
Date: Fri, 21 Apr 2023 15:57:47 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Johannes Thumshirn <jth@kernel.org>
Message-ID: <20230421065747.GB1496740@google.com>
References: <20230420100501.32981-1-jth@kernel.org>
 <20230420100501.32981-14-jth@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230420100501.32981-14-jth@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mailman-Approved-At: Fri, 21 Apr 2023 08:40:02 +0000
Subject: Re: [Cluster-devel] [PATCH v4 13/22] zram: use __bio_add_page for
 adding single page to bio
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
Cc: shaggy@kernel.org, jfs-discussion@lists.sourceforge.net, linux-mm@kvack.org,
 dm-devel@redhat.com, hch@lst.de,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>, willy@infradead.org,
 cluster-devel@redhat.com, kch@nvidia.com, snitzer@kernel.org,
 ming.lei@redhat.com, linux-block@vger.kernel.org, hare@suse.de,
 dsterba@suse.com, axboe@kernel.dk, linux-raid@vger.kernel.org,
 damien.lemoal@wdc.com, song@kernel.org, johannes.thumshirn@wdc.com,
 Minchan Kim <minchan@kernel.org>, linux-fsdevel@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: chromium.org
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

+ Minchan

On (23/04/20 12:04), Johannes Thumshirn wrote:
> 
> From: Johannes Thumshirn <johannes.thumshirn@wdc.com>
> 
> The zram writeback code uses bio_add_page() to add a page to a newly
> created bio. bio_add_page() can fail, but the return value is never
> checked.
> 
> Use __bio_add_page() as adding a single page to a newly created bio is
> guaranteed to succeed.
> 
> This brings us a step closer to marking bio_add_page() as __must_check.
> 
> Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
> Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>

