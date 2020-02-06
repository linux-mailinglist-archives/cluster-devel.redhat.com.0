Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 6B3711549E7
	for <lists+cluster-devel@lfdr.de>; Thu,  6 Feb 2020 18:03:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581008608;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=byXTpNaO/u1ZH5i6VbkM/U9dg4azBAgIZDV9VfmNYc8=;
	b=eSwrsYblBNtOnIRe0mzZHBkrS8yaQ4gjWmlLnKnzSwvhczUBW/44pNGbyIJtMkf7i4HOJp
	wKatJ3qKYqtf8ZU2xc2xQ5IjVPxG1WW600ofgu3F8b6yItvBDUQnFo1AGWJ3vZylqmlImv
	+lUwuappwlR7xtcmaL6gfTi7nxMOQkI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-eo46iqSbNiab99nDInWl4w-1; Thu, 06 Feb 2020 12:03:26 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53EDF109D884;
	Thu,  6 Feb 2020 17:03:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 89CC0100164D;
	Thu,  6 Feb 2020 17:03:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BA41A180880B;
	Thu,  6 Feb 2020 17:03:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 016H3JjY002278 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 6 Feb 2020 12:03:19 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9096710993D; Thu,  6 Feb 2020 17:03:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BF9610993C
	for <cluster-devel@redhat.com>; Thu,  6 Feb 2020 17:03:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B5EA1011E21
	for <cluster-devel@redhat.com>; Thu,  6 Feb 2020 17:03:17 +0000 (UTC)
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
	[209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-10-vkEFPocSOFGy1emgiStdUA-1; Thu, 06 Feb 2020 12:03:11 -0500
Received: by mail-ot1-f69.google.com with SMTP id t10so3564222otc.9
	for <cluster-devel@redhat.com>; Thu, 06 Feb 2020 09:03:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=c3i93r0E5BgcumDG+JMz7C4vLo/BLrCKBaySy2ei9Hs=;
	b=hfL+JLPfQMHPqFn9GWZ/3Funqj5fH4Eh5cL1UKSODHeff/0FTnJaiZUBX6WvvX7Z1T
	8q9N2BPaYJFO2zaqS+0vJ9vT2gglSPdZvgu+dyyNAZm/o7Jmrf/3heyTj86BDClGII3g
	mGVa3nYTp8OPboWb1FOL+ABkh2c3txk+3llOPNB8aUKRv8pTaYjKHPjv1/hPPspm3xaU
	U7+Ym1xU0HkipyryEQg+fzFVwfGUEiHyWOq1BH92DJ9mZER3fkQ7RpZ3gYxm0s/G/38F
	y33g0VVvTRzrR9N8nonQTYQUwHhJZZQuZkK3oXLBrzAbzNWklOPjUrbJYDK1xyunNTs2
	XiQA==
X-Gm-Message-State: APjAAAXqgOKJfKd18Vn5wFXQmVLJNVF3eNzhZ0nIye8jbc2YTuNal+kR
	nrm/6xxKbNOlrBmRaYRCJXgGw68WoaV5bVFgVc+cRvSVplGCMkIEA4XgWjtE7p4DIbYJLM8dSkG
	09PvYDfVFTuBMHsgeWDXg3KOkyFjtYZKbOf3zpw==
X-Received: by 2002:a9d:7984:: with SMTP id h4mr31944744otm.297.1581008589766; 
	Thu, 06 Feb 2020 09:03:09 -0800 (PST)
X-Google-Smtp-Source: APXvYqwJKeXaXxP11CLsnBdf0c6qi7Uts3iIy29wQx1NvGRRnSqx9VNBnSJDrXE/YxXyZkxDnIgHSbtzVRj7VOwirpg=
X-Received: by 2002:a9d:7984:: with SMTP id h4mr31944719otm.297.1581008589466; 
	Thu, 06 Feb 2020 09:03:09 -0800 (PST)
MIME-Version: 1.0
References: <20200206153720.31584-1-agruenba@redhat.com>
	<20200206163411.GB22198@lst.de>
In-Reply-To: <20200206163411.GB22198@lst.de>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 6 Feb 2020 18:02:57 +0100
Message-ID: <CAHc6FU7Ykp9Huwt3riLXH_sPhY9HjA3owdUbt+7MJyHK3_eR=w@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-MC-Unique: vkEFPocSOFGy1emgiStdUA-1
X-MC-Unique: eo46iqSbNiab99nDInWl4w-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 016H3JjY002278
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [PATCH] gfs2: Clean up gfs2_file_write_iter and
	fix O_SYNC write handling
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2020 at 5:34 PM Christoph Hellwig <hch@lst.de> wrote:
> >       if (iocb->ki_flags & IOCB_DIRECT) {
> >               struct address_space *mapping =3D file->f_mapping;
> > +             ssize_t buffered, ret2;
> >
> > +             ret =3D gfs2_file_direct_write(iocb, from);
> > +             if (ret < 0 || !iov_iter_count(from))
> >                       goto out_unlock;
> >
> >               current->backing_dev_info =3D inode_to_bdi(inode);
> > +             buffered =3D iomap_file_buffered_write(iocb, from, &gfs2_=
iomap_ops);
> >               current->backing_dev_info =3D NULL;
> > -             if (unlikely(ret < 0))
> > +             if (unlikely(buffered <=3D 0))
> >                       goto out_unlock;
> >
> >               /*
> >                * We need to ensure that the page cache pages are writte=
n to
> >                * disk and invalidated to preserve the expected O_DIRECT
> > +              * semantics.  If the writeback or invalidate fails, only=
 report
> > +              * the direct I/O range as we don't know if the buffered =
pages
> > +              * made it to disk.
> >                */
> > +             iocb->ki_pos +=3D buffered;
> > +             iocb->ki_flags |=3D IOCB_DSYNC;
>
> I think I'd rather add IOCB_DSYNC before calling
> iomap_file_buffered_write, just in case we ever do optimizations for
> synchronous I/O there.

Okay, that shouldn't hurt.

> > +             ret2 =3D generic_write_sync(iocb, buffered);
> > +             invalidate_mapping_pages(mapping,
> > +                                      (iocb->ki_pos - buffered) >> PAG=
E_SHIFT,
>
> This adds a line > 80 chars.
>
> Otherwise this looks fine to me, although I'd just put the fix in the
> subject line and just mention the cleanup at the end of the actual
> commit log.

Alright.

Thanks,
Andreas


