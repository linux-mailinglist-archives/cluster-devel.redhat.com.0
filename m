Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 959C66554AA
	for <lists+cluster-devel@lfdr.de>; Fri, 23 Dec 2022 22:05:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671829530;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=5cP42GPh1Zd1V9Znr6XVS1D8/g9HXjBYYIctavT/gQE=;
	b=CvodMNW2qlS5cDaTLMwGGuXMo8D46voZLk30a5e1TgdrD8SraMMEfaMiukGsAkaihgtqlU
	qtH7Qw1r19cpnuVzfF4ra0Ss6twtW2p9RXsIPCSzx3/e1QD0uGwPNtrNggTzGSRWtQiBHG
	wnmeBq+M3TBkj0EBGFL/sD05oLg0jUk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-21-v2pMpEZ5PvmTjBsFw4DMQQ-1; Fri, 23 Dec 2022 16:05:25 -0500
X-MC-Unique: v2pMpEZ5PvmTjBsFw4DMQQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D3F643804530;
	Fri, 23 Dec 2022 21:05:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9C4CF111F3B0;
	Fri, 23 Dec 2022 21:05:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 66D2A19465B6;
	Fri, 23 Dec 2022 21:05:24 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DD47319465B1 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 23 Dec 2022 21:05:22 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 83E32492C18; Fri, 23 Dec 2022 21:05:22 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D0EC492C14
 for <cluster-devel@redhat.com>; Fri, 23 Dec 2022 21:05:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 630BA811E6E
 for <cluster-devel@redhat.com>; Fri, 23 Dec 2022 21:05:22 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-664-F8r-sqGCNv2cnSxlKZ4TCA-1; Fri, 23 Dec 2022 16:05:18 -0500
X-MC-Unique: F8r-sqGCNv2cnSxlKZ4TCA-1
Received: by mail-qv1-f51.google.com with SMTP id d2so3834760qvp.12;
 Fri, 23 Dec 2022 13:05:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5cP42GPh1Zd1V9Znr6XVS1D8/g9HXjBYYIctavT/gQE=;
 b=L3HXGpVaGYkKU5p7SXAMw5AH/3TeuDUcxhbfPh9SHlMRJZWjBeB28RGv77C0n7++4x
 JmmA6fR6EOWyQB2rsqfZDMkuqHgYBxCBJ6asphee1NL/2y63LPK2EwKrd1OuWMpsuqxC
 esAfQ/uQ0enB4igLIwm2jQ0I+5s5sDKtJERiD4p80MrliSMRhNWY7QGnc+TeqPhXChIx
 S7JCo0ijTmpw+eEdv5xn+EdZijPT2Cgg2Ph5o4Vre5VJ6IoQvh0eVKpQz4JVYoIlMa+p
 c9ABEjpolT6iow+xdULvz2YiDZGe7vNW/qGpu0+hNE7r3LPQEqsGctnrqFqL7lyLUI6i
 QVkQ==
X-Gm-Message-State: AFqh2krmiTI+BMZXqugdOh1w41kknEdXUh5U+va7JdwUbLnZeG52wUVI
 4OkViNtSuzh05CA7wRT0AYge+4/fo0XD/0hTGQo=
X-Google-Smtp-Source: AMrXdXuEfLjy3xae/nHYRmmwDCDruWBczLKaHB7Vrtu6MmdFuY4+mXm1BqlI7fQcBsYsgp2lNHDLUzqnEROi9BOP1iM=
X-Received: by 2002:a0c:c3c9:0:b0:530:970b:b95e with SMTP id
 p9-20020a0cc3c9000000b00530970bb95emr31681qvi.2.1671829517992; Fri, 23 Dec
 2022 13:05:17 -0800 (PST)
MIME-Version: 1.0
References: <20221216150626.670312-1-agruenba@redhat.com>
 <20221216150626.670312-5-agruenba@redhat.com>
 <Y6XDhb2IkNOdaT/t@infradead.org>
In-Reply-To: <Y6XDhb2IkNOdaT/t@infradead.org>
From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Date: Fri, 23 Dec 2022 22:05:05 +0100
Message-ID: <CAHpGcMLzTrn3ZUB4S8gjpz+aGj+R1hAu38m-PL5rVj-W-0G2ZA@mail.gmail.com>
To: Christoph Hellwig <hch@infradead.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [Cluster-devel] [RFC v3 4/7] iomap: Add iomap_folio_prepare
 helper
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
 linux-ext4@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Am Fr., 23. Dez. 2022 um 16:22 Uhr schrieb Christoph Hellwig
<hch@infradead.org>:
> > +struct folio *iomap_folio_prepare(struct iomap_iter *iter, loff_t pos)
> > +{
> > +     unsigned fgp = FGP_LOCK | FGP_WRITE | FGP_CREAT | FGP_STABLE | FGP_NOFS;
> > +
> > +     if (iter->flags & IOMAP_NOWAIT)
> > +             fgp |= FGP_NOWAIT;
> > +
> > +     return __filemap_get_folio(iter->inode->i_mapping, pos >> PAGE_SHIFT,
> > +                     fgp, mapping_gfp_mask(iter->inode->i_mapping));
> > +}
> > +EXPORT_SYMBOL(iomap_folio_prepare);
>
> I'd name this __iomap_get_folio to match __filemap_get_folio.

I was looking at it from the filesystem point of view: this helper is
meant to be used in ->folio_prepare() handlers, so
iomap_folio_prepare() seemed to be a better name than
__iomap_get_folio().

> And all iomap exports are EXPORT_SYMBOL_GPL.

Sure.

Thanks,
Andreas

