Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0C16D4033
	for <lists+cluster-devel@lfdr.de>; Mon,  3 Apr 2023 11:22:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680513770;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=agncQKz6RRQ+z2AndB9egaUCjOR2XStw/8eDPUmcjT8=;
	b=JS/6WQcUQaSVztfbvz8hytNDkEHsOwN+nqoHU5HVUH6cgwukPAxR4noTB1Lnxlov+wglLu
	8p3lG5AeIe6hxZwAW0Mms6Vznem+o1QSV/ZqlzmFuf00jVqqJok7t8Mv+fSjzr2cXLMOQF
	xQBbdEjN9fntYB0k6EMtQ993C1DV2U4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-339-tTcfEcDtOfyj4Uly8bYLyg-1; Mon, 03 Apr 2023 05:22:47 -0400
X-MC-Unique: tTcfEcDtOfyj4Uly8bYLyg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1D91F100DEB2;
	Mon,  3 Apr 2023 09:22:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0D8DE175AD;
	Mon,  3 Apr 2023 09:22:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7451D1946A4C;
	Mon,  3 Apr 2023 09:22:44 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9D6B119465BD for <cluster-devel@listman.corp.redhat.com>;
 Fri, 31 Mar 2023 17:52:36 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C6C24492C3E; Fri, 31 Mar 2023 17:52:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BF3E7492B00
 for <cluster-devel@redhat.com>; Fri, 31 Mar 2023 17:52:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 991371C075A5
 for <cluster-devel@redhat.com>; Fri, 31 Mar 2023 17:52:36 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-6n0lDVNgO0uwd8VvGgWfDw-1; Fri, 31 Mar 2023 13:52:33 -0400
X-MC-Unique: 6n0lDVNgO0uwd8VvGgWfDw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 08BA762AE5;
 Fri, 31 Mar 2023 17:47:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B891C433EF;
 Fri, 31 Mar 2023 17:47:22 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id b6so3837421ljr.1;
 Fri, 31 Mar 2023 10:47:22 -0700 (PDT)
X-Gm-Message-State: AAQBX9fOipWCruLPKBdFJVPNEWJGRn9A0AVvoLJnKi2usUFxg+2/CMaa
 Z3OJUGOz4T7ztCgwfxzHSJxNx3MYeynECPFDOjE=
X-Google-Smtp-Source: AKy350YsVC49X4YKPGPcvZZvpV/eK4Pm1deoqn4/arjrTKATbsjiI11VNkB5amsOZg1wLI0Ovo0EsryvUkWIU3e100g=
X-Received: by 2002:a2e:9d16:0:b0:2a6:16b4:40a2 with SMTP id
 t22-20020a2e9d16000000b002a616b440a2mr2329769lji.5.1680284840437; Fri, 31 Mar
 2023 10:47:20 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1680172791.git.johannes.thumshirn@wdc.com>
 <359e6d4d77ee175e2ce7c315a3176ca360e10fbc.1680172791.git.johannes.thumshirn@wdc.com>
In-Reply-To: <359e6d4d77ee175e2ce7c315a3176ca360e10fbc.1680172791.git.johannes.thumshirn@wdc.com>
From: Song Liu <song@kernel.org>
Date: Fri, 31 Mar 2023 10:47:08 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5twFinPtGkAORYW04fqQP3L9NJZDX++_hAbKPrLbF95g@mail.gmail.com>
Message-ID: <CAPhsuW5twFinPtGkAORYW04fqQP3L9NJZDX++_hAbKPrLbF95g@mail.gmail.com>
To: Johannes Thumshirn <johannes.thumshirn@wdc.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mailman-Approved-At: Mon, 03 Apr 2023 09:22:43 +0000
Subject: Re: [Cluster-devel] [PATCH v2 05/19] md: use __bio_add_page to add
 single page
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
 Damien Le Moal <damien.lemoal@wdc.com>, cluster-devel@redhat.com,
 Chaitanya Kulkarni <kch@nvidia.com>, Dave Kleikamp <shaggy@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Mike Snitzer <snitzer@kernel.org>, jfs-discussion@lists.sourceforge.net,
 Matthew Wilcox <willy@infradead.org>, Ming Lei <ming.lei@redhat.com>,
 linux-block@vger.kernel.org, linux-mm@kvack.org, dm-devel@redhat.com,
 David Sterba <dsterba@suse.com>, Hannes Reinecke <hare@suse.de>,
 linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 30, 2023 at 3:44=E2=80=AFAM Johannes Thumshirn
<johannes.thumshirn@wdc.com> wrote:
>
> The md-raid superblock writing code uses bio_add_page() to add a page to =
a
> newly created bio. bio_add_page() can fail, but the return value is never
> checked.
>
> Use __bio_add_page() as adding a single page to a newly created bio is
> guaranteed to succeed.
>
> This brings us a step closer to marking bio_add_page() as __must_check.
>
> Signed-of_-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
> Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

Acked-by: Song Liu <song@kernel.org>

