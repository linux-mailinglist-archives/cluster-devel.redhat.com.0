Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 651E66D4035
	for <lists+cluster-devel@lfdr.de>; Mon,  3 Apr 2023 11:22:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680513771;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=74+LZlMHcYsg/Kzq6hhnAAWL6JxtgVVZqUzMUNQ+9TU=;
	b=cu02iSiDODoTe3jSMdUXcm5BuuCo9zxHksIFWinxHwxoH193aLEDTxht2eTN4QJEOxATB4
	Gt3RsdWF8dv/8MEvPhnI+x1QK9/D/k1pJJPYAvB8ytAUb1nr1X6+aKn6OHNf0LbCduzP6/
	+hXToBlGbGD5CEJBzOqnFIyQDefjp1g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-224-NHjn76LjPlKs_pDy2LTxDw-1; Mon, 03 Apr 2023 05:22:47 -0400
X-MC-Unique: NHjn76LjPlKs_pDy2LTxDw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1CE40800B23;
	Mon,  3 Apr 2023 09:22:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B3D261121314;
	Mon,  3 Apr 2023 09:22:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 55D3619465B1;
	Mon,  3 Apr 2023 09:22:44 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BACC719465BC for <cluster-devel@listman.corp.redhat.com>;
 Fri, 31 Mar 2023 17:54:31 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9DCB9440D8; Fri, 31 Mar 2023 17:54:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9592051FF
 for <cluster-devel@redhat.com>; Fri, 31 Mar 2023 17:54:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 74B8A8030A0
 for <cluster-devel@redhat.com>; Fri, 31 Mar 2023 17:54:31 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-133-hLslg4RSO3y_qZQY_56vwA-1; Fri, 31 Mar 2023 13:54:28 -0400
X-MC-Unique: hLslg4RSO3y_qZQY_56vwA-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F19A3B83137;
 Fri, 31 Mar 2023 17:48:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A440C433A4;
 Fri, 31 Mar 2023 17:48:09 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id h11so22953688lfu.8;
 Fri, 31 Mar 2023 10:48:09 -0700 (PDT)
X-Gm-Message-State: AAQBX9fOrfgmltab3YBzl8Ops+I2K6xku59PU16aBIFYwEgvaMu0ZOAK
 vPh0x+4e0qnexacPEgsD17gmcc33GqLX91oy00c=
X-Google-Smtp-Source: AKy350aGmAaw8YhQDsMHFPqOZHOf0YFrm6+Qrmu1o39ibtrUhRAoJ2hJNrBTR72DBPR1w52lhQ7Kxsz8Es6oFrG/it4=
X-Received: by 2002:ac2:5d72:0:b0:4ea:e296:fead with SMTP id
 h18-20020ac25d72000000b004eae296feadmr8226352lft.3.1680284887179; Fri, 31 Mar
 2023 10:48:07 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1680172791.git.johannes.thumshirn@wdc.com>
 <29a2488aa641319199c597d1dc1151c700e32430.1680172791.git.johannes.thumshirn@wdc.com>
In-Reply-To: <29a2488aa641319199c597d1dc1151c700e32430.1680172791.git.johannes.thumshirn@wdc.com>
From: Song Liu <song@kernel.org>
Date: Fri, 31 Mar 2023 10:47:55 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7HoY_0fW12egZuirTX22LTQJvBw49MEaT5_sh4ty+xCw@mail.gmail.com>
Message-ID: <CAPhsuW7HoY_0fW12egZuirTX22LTQJvBw49MEaT5_sh4ty+xCw@mail.gmail.com>
To: Johannes Thumshirn <johannes.thumshirn@wdc.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mailman-Approved-At: Mon, 03 Apr 2023 09:22:43 +0000
Subject: Re: [Cluster-devel] [PATCH v2 07/19] md: raid5: use __bio_add_page
 to add single page to new bio
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 30, 2023 at 3:44=E2=80=AFAM Johannes Thumshirn
<johannes.thumshirn@wdc.com> wrote:
>
> The raid5-ppl submission code uses bio_add_page() to add a page to a
> newly created bio. bio_add_page() can fail, but the return value is never
> checked. For adding consecutive pages, the return is actually checked and
> a new bio is allocated if adding the page fails.
>
> Use __bio_add_page() as adding a single page to a newly created bio is
> guaranteed to succeed.
>
> This brings us a step closer to marking bio_add_page() as __must_check.
>
> Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
> Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

Acked-by: Song Liu <song@kernel.org>

