Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD4049871C
	for <lists+cluster-devel@lfdr.de>; Mon, 24 Jan 2022 18:40:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643046046;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=WjBDf6aQrfObbBjTLFtxuNqmDl1jBGQg6+6y9Yi96mM=;
	b=ETPMabZFZUkj7M5+K3rypWSUNLzDykPmx7WSfg8LSNl5/+NXFlL6y6weIxlS/1t0c6Uqu5
	8L1WxIBaiJf7L+iVblRo0K0gjZRF/y/ViL8m7eWM0YSYwz2hmKtZhjBuxK9Ykga6zudVJ/
	3Liky1awj5snY93uFEUXkQMnaMUlHbM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-402-h1m6H1cEOB2BfhzqGBkfnQ-1; Mon, 24 Jan 2022 12:40:43 -0500
X-MC-Unique: h1m6H1cEOB2BfhzqGBkfnQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BED5480292F;
	Mon, 24 Jan 2022 17:40:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F04D84D2C;
	Mon, 24 Jan 2022 17:40:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 56D581806D1C;
	Mon, 24 Jan 2022 17:40:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
	[10.11.54.8])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20OHaJkV001579 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 24 Jan 2022 12:36:19 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5FFBFC0809B; Mon, 24 Jan 2022 17:36:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5CBACC01783
	for <cluster-devel@redhat.com>; Mon, 24 Jan 2022 17:36:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4214F181E060
	for <cluster-devel@redhat.com>; Mon, 24 Jan 2022 17:36:19 +0000 (UTC)
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
	[209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-537-jAIhtprRP9SpibZzfG-jag-1; Mon, 24 Jan 2022 12:36:17 -0500
X-MC-Unique: jAIhtprRP9SpibZzfG-jag-1
Received: by mail-qv1-f70.google.com with SMTP id
	ge15-20020a05621427cf00b00421df9f8f23so7630594qvb.17
	for <cluster-devel@redhat.com>; Mon, 24 Jan 2022 09:36:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WjBDf6aQrfObbBjTLFtxuNqmDl1jBGQg6+6y9Yi96mM=;
	b=AV/9Gr7Zagy10nTwW6Jm5wrj6wnjCBPD33N+egu40wDYApAbWI2AnNnzaYSKvhI5BI
	xxhZeruWTRVsYZAo9ZDuq9X4sM7b7MML1VVBs+G+iF91iPxRrcsI/dCiDa68NFVcMreK
	HOLQx+gl90u1+aYg+rD0lFOX3tY2liIi0YlvZGyqNV541Q5eaz29miAGA53id1D0RC9p
	n2gkRmmaCcKx9CQV3C+DnISuegfaYcaQERXIeYhs9dNxEHdFjmHuzHVDjYibfdfYz4Zm
	n1V3FoZZVEZZAIJHPdnJnhm5zH4iBLWBMb+SvHVIW/1P6iQgtiHI732wgKRBmJTprh5g
	rq4A==
X-Gm-Message-State: AOAM531dWA/pVUe2RMoTDdrDJNZAdURjE9ZERrQlKqnVYVTnf4xlZF8m
	DnEpv7psyU52bilU4CMieTT0T6Bjp8jeXDmwdoHgrfMyIcgUm/npy2dK6Ir62q21FYTR4zorxCW
	eEAQpaSjmKjIqlm4nkTn+C50PjdzzisIio/FoJQ==
X-Received: by 2002:a05:622a:154:: with SMTP id
	v20mr13313780qtw.291.1643045777122; 
	Mon, 24 Jan 2022 09:36:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzekCkfE92GPinXMJeJVNleUpPXFDuFcVsiLj6BYCwesW3YBTj4opk1FKA8tMEDl+ZjXtRSE5Ok2D2HOBmeptY=
X-Received: by 2002:a05:622a:154:: with SMTP id
	v20mr13313769qtw.291.1643045776895; 
	Mon, 24 Jan 2022 09:36:16 -0800 (PST)
MIME-Version: 1.0
References: <202201221028.YKA8kSdm-lkp@intel.com>
	<CAK-6q+h_hb94J3DSXPk=E44kCxiwZ+BE3kMJe09iShRzMb=vzQ@mail.gmail.com>
	<91901e7b-7d82-116c-aaf2-c74c6a6b999c@infradead.org>
	<CAK-6q+j2jc3pBmbvQ-DCmxveC-UMV75SFc2nC1zwXKe9wm4YPg@mail.gmail.com>
	<20220124124530.GS1951@kadam>
	<CAK-6q+iZfY=FyOxJfS7cY7MqScs+nU=U3B4NnLnvcLH3fofuAg@mail.gmail.com>
In-Reply-To: <CAK-6q+iZfY=FyOxJfS7cY7MqScs+nU=U3B4NnLnvcLH3fofuAg@mail.gmail.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Mon, 24 Jan 2022 12:36:06 -0500
Message-ID: <CAK-6q+ga2zT2h4oY0=aCXFeU=oaFHbSXGzuVRptB8Hg-YKR7Gw@mail.gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-loop: cluster-devel@redhat.com
Cc: rcu@vger.kernel.org, kbuild-all@lists.01.org,
	kernel test robot <lkp@intel.com>, Randy Dunlap <rdunlap@infradead.org>,
	linux-kernel@vger.kernel.org, cluster-devel <cluster-devel@redhat.com>,
	linux-sparse@vger.kernel.org, "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [Cluster-devel] fs/dlm/midcomms.c:913:22: sparse: sparse:
 restricted __le32 degrades to integer
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Mon, Jan 24, 2022 at 12:21 PM Alexander Aring <aahringo@redhat.com> wrote:
>
> Hi,
>
> On Mon, Jan 24, 2022 at 7:46 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > On Sun, Jan 23, 2022 at 01:41:52PM -0500, Alexander Aring wrote:
> > >
> > > I see also:
> > >
> > > fs/dlm/midcomms.c:213:1: sparse: sparse: symbol
> > > '__srcu_struct_nodes_srcu' was not declared. Should it be static?
> > >
> >
> > Why not just do this?  (Untested.  Maybe I don't understand?)
> >
> > diff --git a/include/linux/srcutree.h b/include/linux/srcutree.h
> > index cb1f4351e8ba..a164089abec4 100644
> > --- a/include/linux/srcutree.h
> > +++ b/include/linux/srcutree.h
> > @@ -121,7 +121,7 @@ struct srcu_struct {
> >  #ifdef MODULE
> >  # define __DEFINE_SRCU(name, is_static)                                        \
> >         is_static struct srcu_struct name;                              \
> > -       struct srcu_struct * const __srcu_struct_##name                 \
> > +       is_static struct srcu_struct * const __srcu_struct_##name       \
> >                 __section("___srcu_struct_ptrs") = &name
> >  #else
> >  # define __DEFINE_SRCU(name, is_static)                                        \
> >
>
> I tried it and yes it will fix the issue and introduce another one
> about "is_static struct srcu_struct * const __srcu_struct_##name" is
> unused ("-Wunused-const-variable").
> I added a __maybe_unused after the introduced is_static and it seems
> to fix the introduced issue, now it compiles and sparse is happy. I am
> not sure if this is the right fix?

it is obviously unused, but it has something to do with
"__section("___srcu_struct_ptrs")" and during module loading it, I
suppose, srcu tries to access it to find whatever needs to be
registered?

- Alex

