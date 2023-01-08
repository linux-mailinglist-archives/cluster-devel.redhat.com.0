Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A2066189B
	for <lists+cluster-devel@lfdr.de>; Sun,  8 Jan 2023 20:40:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673206850;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=33qTT0r6wAZ1WTwwlWCp7SkxG6n6RS0yiwUpFiSj+fQ=;
	b=Vc0PjwtgYK8BWGI0pyJC/YJ47yCsBpKFwPikW7P62qcgPE5m4Q3VlPd2PB/rUlyBwHzZfa
	ExLx9lN1xHzMgrgcJvJ0X4uGAYmKrgZwfVl7zeugxAcgfzNKPjKyDnvo32G+aRtcrOk6kT
	+T2MND2hEMsak5H2j5zCAnhNXfU8u78=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-424-ozk_zK20NbWsbZuarAARdQ-1; Sun, 08 Jan 2023 14:40:46 -0500
X-MC-Unique: ozk_zK20NbWsbZuarAARdQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B8DFC1875042;
	Sun,  8 Jan 2023 19:40:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AC03542222;
	Sun,  8 Jan 2023 19:40:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7E4651947062;
	Sun,  8 Jan 2023 19:40:45 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 586AA1946586 for <cluster-devel@listman.corp.redhat.com>;
 Sun,  8 Jan 2023 19:40:44 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3EB5F40C2004; Sun,  8 Jan 2023 19:40:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 36F3440C2064
 for <cluster-devel@redhat.com>; Sun,  8 Jan 2023 19:40:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 18DD4811E6E
 for <cluster-devel@redhat.com>; Sun,  8 Jan 2023 19:40:44 +0000 (UTC)
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-367-QevZDDsqMSK6qAry6ko2iQ-1; Sun, 08 Jan 2023 14:40:42 -0500
X-MC-Unique: QevZDDsqMSK6qAry6ko2iQ-1
Received: by mail-pg1-f200.google.com with SMTP id
 r22-20020a63ce56000000b00478f1cfb0fbso2980034pgi.0
 for <cluster-devel@redhat.com>; Sun, 08 Jan 2023 11:40:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=33qTT0r6wAZ1WTwwlWCp7SkxG6n6RS0yiwUpFiSj+fQ=;
 b=HezZFQd0dosV7rBLZe5+bYpiaafsfMNN/ITbV7BEC2JKdm903N4xWQfCNY5neCgsac
 nImkpNV8b+FaidA3jPOzdNa6XVY5M8NShF3bEKPp/UiI+3F2D4AYIwa1BIZCaGcuQnlP
 mGqS/vqFuq53HskTpfhn52xzaHug6MgbPBCRle4+OSHgsGHCNQ1bCHreQfMC8Sx3gvD3
 J23UjlnFpEpV/zpnfLCV+WO/MzMcBmovVuSgyir9VFiIIJKyQZFQJ8/Fh19E795ZmOmJ
 gF20GtYlijh2xYBrgsPo+Ow9b8frg9/lOOlN9BbD/um5YAgMGmr3OIMdWeZmmlgEgzgW
 e39w==
X-Gm-Message-State: AFqh2kq9cHSHYgr2D82JWja2NPDuXnoxZpwAY13XJNXShiZdB4yjSdcN
 BEnx8hES9gl3b4dlkWdZ/wH/qwd3S8BZYK8dWdwDpRZGEAoYzBXx5O/Lrkvs5rwBHEcexZR1NWx
 0bvBU1g5H9bR9TZieDVzu1wZslGeZyLLfQaHAIg==
X-Received: by 2002:a63:5d1b:0:b0:495:fb5f:439d with SMTP id
 r27-20020a635d1b000000b00495fb5f439dmr3366898pgb.68.1673206841645; 
 Sun, 08 Jan 2023 11:40:41 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu1lJQZfWW6xV/PSksmTNaQzyZoMTAsvtqnDEI+7F2q3BfsEW4wdkPdTNM+CpyXNcR3EqzkjBqi270j/f370sU=
X-Received: by 2002:a63:5d1b:0:b0:495:fb5f:439d with SMTP id
 r27-20020a635d1b000000b00495fb5f439dmr3366894pgb.68.1673206841425; Sun, 08
 Jan 2023 11:40:41 -0800 (PST)
MIME-Version: 1.0
References: <20221231150919.659533-1-agruenba@redhat.com>
 <20221231150919.659533-6-agruenba@redhat.com>
 <Y7r9gnn2q3PnQ030@infradead.org>
In-Reply-To: <Y7r9gnn2q3PnQ030@infradead.org>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Sun, 8 Jan 2023 20:40:29 +0100
Message-ID: <CAHc6FU6UF3CZWqdDoDieFgKZk6_PiJfmBi5jWFTRoNgk9D8-5Q@mail.gmail.com>
To: Christoph Hellwig <hch@infradead.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [Cluster-devel] [PATCH v5 5/9] iomap/gfs2: Get page in
 page_prepare handler
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 8, 2023 at 6:29 PM Christoph Hellwig <hch@infradead.org> wrote:
> > +     if (page_ops && page_ops->page_prepare)
> > +             folio = page_ops->page_prepare(iter, pos, len);
> > +     else
> > +             folio = iomap_get_folio(iter, pos);
> > +     if (IS_ERR(folio))
> >               return PTR_ERR(folio);
>
> I'd love to have a iomap_get_folio helper for this sequence so that
> we match iomap_put_folio.  That would require renaming the current
> iomap_get_folio to __iomap_get_folio.

That's the wrong way around though. iomap_get_folio() is exported to
filesystems, so if at all, we should rename iomap_put_folio() which is
a static function only used in the iomap code.

I'll post an update.

Thanks,
Andreas

