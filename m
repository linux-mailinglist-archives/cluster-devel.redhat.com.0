Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9D2663C3E
	for <lists+cluster-devel@lfdr.de>; Tue, 10 Jan 2023 10:07:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673341667;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=gXHkdvWBXNLyizQqN+zkUZ//tPu5q4K0Ow4ZbjvaKhg=;
	b=LemqORozKQCsGECNnKunAHvbQlO9OqMGj+U/I4iyhGTWRXoYSLHn0LRfNh/yvr+/UcJVwJ
	cbAlx4Neer4rTJwuMLnoSk/v6X5cwgquObq0UF0KJCGJTA6JFTU6gubNfsnYDsOHn7WKeg
	V0k114jjIZgbjqSOZQALXkZe6x4bXkE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-42--dFT56sQMBmZSEauAxSvUA-1; Tue, 10 Jan 2023 04:07:44 -0500
X-MC-Unique: -dFT56sQMBmZSEauAxSvUA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BBBD585A588;
	Tue, 10 Jan 2023 09:07:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A789F1121314;
	Tue, 10 Jan 2023 09:07:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7DDC2194037E;
	Tue, 10 Jan 2023 09:07:43 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EF2811946587 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 10 Jan 2023 09:07:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8DE812026D76; Tue, 10 Jan 2023 09:07:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 854F02026D68
 for <cluster-devel@redhat.com>; Tue, 10 Jan 2023 09:07:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 660E780D0E9
 for <cluster-devel@redhat.com>; Tue, 10 Jan 2023 09:07:42 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-306-xUIXVdEyOxymMtvROrsjOQ-1; Tue, 10 Jan 2023 04:07:40 -0500
X-MC-Unique: xUIXVdEyOxymMtvROrsjOQ-1
Received: by mail-qt1-f172.google.com with SMTP id z12so10345090qtv.5;
 Tue, 10 Jan 2023 01:07:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gXHkdvWBXNLyizQqN+zkUZ//tPu5q4K0Ow4ZbjvaKhg=;
 b=kbBm3f3ch1LrT4U3YRlgg5tSw6iiWTJJZpPHjInAMY0Gfyfa1n1m2PJISG+NrBx/6A
 kFD2KTaFY7dOPFdonYZuBj5XZ34U4n3wZ2lGVaqM4vCxGsJpkCFzcDsJmWmZT97L0BFQ
 v5xM5CjBtyob4fh7dbwY+IHcN55xXMruf/MNJMyKH4jlOx4r8QE93S+MjH1TIsVU25+p
 k3wuT0rxECl9uhNHaozwJXFYXPrLd5hCBuVP9Di8FBkPiLgAa9Syy9+aqtTGAuknc7m5
 VPnJ8NAvLdnMJofcI5bcH/cwEOKZYk0cmuwYd1ZFn6mqC8hTlzCJJvgtQiuc8V/wK6tu
 Qgeg==
X-Gm-Message-State: AFqh2kr+KG96P8DNnHyDx6b14mPsZGS6yHQYdzOqoVYonpQUb5vgBtfU
 LS6M/J8c6Hx4v92JZLDeaGx8GfiZpTvn8YC53Bc=
X-Google-Smtp-Source: AMrXdXs6uhQyxln3cf7HEIycxq2EFSA7Nn+yk7nOOwlXGh0hcw7vP/9kuIOgPi/gxFvAWtY489aIJuA9oy3Nx0jH16g=
X-Received: by 2002:ac8:5544:0:b0:3a9:6c70:3992 with SMTP id
 o4-20020ac85544000000b003a96c703992mr3080249qtr.585.1673341659942; Tue, 10
 Jan 2023 01:07:39 -0800 (PST)
MIME-Version: 1.0
References: <20230108213305.GO1971568@dread.disaster.area>
 <20230108194034.1444764-1-agruenba@redhat.com>
 <20230108194034.1444764-5-agruenba@redhat.com>
 <20230109124642.1663842-1-agruenba@redhat.com>
 <Y70l9ZZXpERjPqFT@infradead.org>
In-Reply-To: <Y70l9ZZXpERjPqFT@infradead.org>
From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Date: Tue, 10 Jan 2023 10:07:28 +0100
Message-ID: <CAHpGcML+3tHmvKzzpun52BfZy94ekqGe+sXWZBDe04D_+0N=Ug@mail.gmail.com>
To: Christoph Hellwig <hch@infradead.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [Cluster-devel] [RFC v6 04/10] iomap: Add iomap_get_folio helper
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
Cc: cluster-devel@redhat.com, "Darrick J . Wong" <djwong@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, linux-xfs@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Am Di., 10. Jan. 2023 um 09:52 Uhr schrieb Christoph Hellwig
<hch@infradead.org>:
> On Mon, Jan 09, 2023 at 01:46:42PM +0100, Andreas Gruenbacher wrote:
> > We can handle that by adding a new IOMAP_NOCREATE iterator flag and
> > checking for that in iomap_get_folio().  Your patch then turns into
> > the below.
>
> Exactly.  And as I already pointed out in reply to Dave's original
> patch what we really should be doing is returning an ERR_PTR from
> __filemap_get_folio instead of reverse-engineering the expected
> error code.
>
> The only big question is if we should apply Dave's patch first as a bug
> fix before this series, and I suspect we should do that.

Sounds fine. I assume Dave is going to send an update.

Thanks,
Andreas

