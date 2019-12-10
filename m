Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id F1E96119696
	for <lists+cluster-devel@lfdr.de>; Tue, 10 Dec 2019 22:28:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1576013284;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=H5mECpigsi5IoO0Gd/OMlOo5Xgi22xFbljTixm/LvJ8=;
	b=eMKO0AztoarLHlPZDUU4NhvTki0PF55j0Hu85edepyFs19BmUYN8M7e+4lK+qDAqRTUCaQ
	ZI8rK3DjHpRTVb/MWg2MYCW8riT3MsBHbssYbIT6R41XJP5CPeStah8GHwyWxvb/5a5D7h
	0jf4m07XsFmF7NByzfcWAVwTN6HGcqs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-7LdDAbL4MMWH5IRsKeTbZQ-1; Tue, 10 Dec 2019 16:28:03 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EACB2DC4E;
	Tue, 10 Dec 2019 21:27:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CEEBF5C1B0;
	Tue, 10 Dec 2019 21:27:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2CD4518089C8;
	Tue, 10 Dec 2019 21:27:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBALRuKX019816 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 10 Dec 2019 16:27:56 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1FA92F89EE; Tue, 10 Dec 2019 21:27:56 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1AC07F9ACB
	for <cluster-devel@redhat.com>; Tue, 10 Dec 2019 21:27:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 967F51804546
	for <cluster-devel@redhat.com>; Tue, 10 Dec 2019 21:27:53 +0000 (UTC)
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-330-B1ZQPqJxN-O80NBYpPCkdw-1; Tue, 10 Dec 2019 16:27:52 -0500
Received: by mail-io1-f66.google.com with SMTP id s2so20384442iog.10;
	Tue, 10 Dec 2019 13:27:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=H5mECpigsi5IoO0Gd/OMlOo5Xgi22xFbljTixm/LvJ8=;
	b=OXo8y9rfD5+/w668t+q7ggxxV7S4hpcIdiry5cqONJZSuqD7fFvY7lLYhhZ9aHR1kL
	jAqBgl5a4kXo8g+QWtt2xbgy+QdvfzirkS5dTnqjCCh7mPvkAA9izjrKO5/TZypeJsQA
	LQzkMYRL1WcpstwqptutIczEEkb01HKVgAvDK1mMNlIENVkvacB3xaElUmvutHc4KOwY
	9pzsFX0TAy+Jm1/GJSLliTAQS3spou3tT9YATtENmF5kqfea50d9/uEcX+Hni5c6h981
	rGJLlnVAiN6LlzMUInZ7rWgNJbLW2Al3k8NPkjudFzXarFxFoGIuOWXr1qp/G5SEXLx3
	9foA==
X-Gm-Message-State: APjAAAUT4hNO0IA4X+5xAId5Qh4DZlHjkyzR0LMiPZgM5JJ4P8UGm8KO
	iG3jk4F4WTv/Nee4c7FHYtcaUxBNG1ofkiLiZAmjBw==
X-Google-Smtp-Source: APXvYqxxlVGO15l7eYtfNXjfLTjwFKDhTrtm/h/TOVV/jLIopcfB40ClbnrIG3zGec04yiaa6oSt6D9GMyznieRnHDU=
X-Received: by 2002:a02:a915:: with SMTP id n21mr28189604jam.117.1576013271029;
	Tue, 10 Dec 2019 13:27:51 -0800 (PST)
MIME-Version: 1.0
References: <20191210102916.842-1-agruenba@redhat.com>
	<20191210203252.GA99875@magnolia>
	<CAHpGcMJMgttnXu48wHnP-WqdPkuXBaFd+COKV9XiRP6VrtRUVg@mail.gmail.com>
	<20191210212552.GC99875@magnolia>
In-Reply-To: <20191210212552.GC99875@magnolia>
From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Date: Tue, 10 Dec 2019 22:27:40 +0100
Message-ID: <CAHpGcMJxoekJvZqW3=9B7Jfpo43N1XzayY0TQc7eWLjHVwvQXg@mail.gmail.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
X-MC-Unique: B1ZQPqJxN-O80NBYpPCkdw-1
X-MC-Unique: 7LdDAbL4MMWH5IRsKeTbZQ-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xBALRuKX019816
X-loop: cluster-devel@redhat.com
Cc: linux-xfs <linux-xfs@vger.kernel.org>,
	cluster-devel <cluster-devel@redhat.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>
Subject: Re: [Cluster-devel] [PATCH] iomap: Export iomap_page_create and
	iomap_set_range_uptodate
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Di., 10. Dez. 2019 um 22:25 Uhr schrieb Darrick J. Wong
<darrick.wong@oracle.com>:
> On Tue, Dec 10, 2019 at 09:39:31PM +0100, Andreas Gr=C3=BCnbacher wrote:
> > Am Di., 10. Dez. 2019 um 21:33 Uhr schrieb Darrick J. Wong
> > <darrick.wong@oracle.com>:
> > > On Tue, Dec 10, 2019 at 11:29:16AM +0100, Andreas Gruenbacher wrote:
> > > > These two functions are needed by filesystems for converting inline
> > > > ("stuffed") inodes into non-inline inodes.
> > > >
> > > > Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> > >
> > > Looks fine to me... this is a 5.6 change, correct?
> >
> > Yes, so there's still plenty of time to get things in place until
> > then. I'd like to hear from Christoph if he has any objections. In any
> > case, this patch isn't going to break anything.
>
> By the way, the other symbols in fs/iomap/ are all EXPORT_SYMBOL_GPL.
> Does gfs2/RH/anyone have a particular requirement for EXPORT_SYMBOL, or
> could we make the new exports _GPL to match the rest?

I don't mind EXPORT_SYMBOL_GPL.

Thanks,
Andreas


