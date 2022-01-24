Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDAA499907
	for <lists+cluster-devel@lfdr.de>; Mon, 24 Jan 2022 22:40:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643060446;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=c7q48nDqJH52nwasKn4MU6PTMavVxq2H/SkUyJ4E2Gc=;
	b=Tmcv/DaZP3vfeIXegSXd38I6flJ6eldg/6xNF2VaHnDGlCPkHzymaK0hLNA1tR2+uTa3t9
	QdkkGoVXDtO17tNT7FWpp5EW94MplemnO2RSZh3D2u2ql902KaOGA0f5rYGeMLQ3wSRlTK
	dYG8okiExyeYSSdTtbdKygs31iKKxK8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-335-xncuBQBkOgWfZYJcrf9EmA-1; Mon, 24 Jan 2022 16:40:43 -0500
X-MC-Unique: xncuBQBkOgWfZYJcrf9EmA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10D00192AB74;
	Mon, 24 Jan 2022 21:40:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A02ED56F6F;
	Mon, 24 Jan 2022 21:40:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 21DA51806D1C;
	Mon, 24 Jan 2022 21:40:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20OLbEZ0022593 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 24 Jan 2022 16:37:14 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 66A3053D3; Mon, 24 Jan 2022 21:37:14 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 614D653D0
	for <cluster-devel@redhat.com>; Mon, 24 Jan 2022 21:37:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 467091044560
	for <cluster-devel@redhat.com>; Mon, 24 Jan 2022 21:37:08 +0000 (UTC)
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
	[209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-350-0jI9ra3OMAKmgGIdggig_A-1; Mon, 24 Jan 2022 16:37:06 -0500
X-MC-Unique: 0jI9ra3OMAKmgGIdggig_A-1
Received: by mail-qk1-f198.google.com with SMTP id
	o3-20020a375a03000000b0047bc1e51002so13284043qkb.19
	for <cluster-devel@redhat.com>; Mon, 24 Jan 2022 13:37:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=c7q48nDqJH52nwasKn4MU6PTMavVxq2H/SkUyJ4E2Gc=;
	b=Jx//hes9e6IHQWExcPfYXUtaCR9sDUNjLm7wn/qIvPFHY2f8Z/YrCKkMNZ2mP9ro9Q
	I+JWezkVnfWWnA1Ql8MF089BodK90hJDq/9pLw6iMMLwLj0uLmNwLvcckMdvTb8PoBPc
	T4Dt4QnmeY9oyQYUkUeBfLdobn1fay8QYc8a1jXtq6ExEDWOCgLpT3rfiIpOyWSaNnb5
	uRGtPi65ddJ0KFDb6vgjkLnyPUlZBqxSCxAncbiG9zHQWHcElzcVUp7bhyWkFFJ5A+I6
	01PyHQpIcNxmry/I+0PIQOCe9jItd4d6iQbhQp0adyJBYgj2yPZHWJqaVgo1665FoiT5
	eDxQ==
X-Gm-Message-State: AOAM532Jkm9o3ScP/5yGN6qVeQySA2E48mQXGCrdzyokyxxzbwEEwgjQ
	WSUHTK3Pa4DS4VrZN3/o58TEZaozYsc7XFvRjBu9jVS2qz2FTGUyrjgmwfdFxa61D/dTHkH4N6d
	e32WIt0QhYq9tyGdDXdmnzUlMhw3hxMWNU6mMjw==
X-Received: by 2002:a05:622a:2ce:: with SMTP id
	a14mr160153qtx.470.1643060226385; 
	Mon, 24 Jan 2022 13:37:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxENcHQBykB+R71peyKNCWZlQR8fLwfIUcwHCuHFtkiFmn2NGP2p8g1zWvx7XU2anZ1AcJ8P5lqh/+uhv6oDxE=
X-Received: by 2002:a05:622a:2ce:: with SMTP id
	a14mr160117qtx.470.1643060225927; 
	Mon, 24 Jan 2022 13:37:05 -0800 (PST)
MIME-Version: 1.0
References: <202201221028.YKA8kSdm-lkp@intel.com>
	<CAK-6q+h_hb94J3DSXPk=E44kCxiwZ+BE3kMJe09iShRzMb=vzQ@mail.gmail.com>
	<91901e7b-7d82-116c-aaf2-c74c6a6b999c@infradead.org>
	<CAK-6q+j2jc3pBmbvQ-DCmxveC-UMV75SFc2nC1zwXKe9wm4YPg@mail.gmail.com>
	<20220124124530.GS1951@kadam>
	<CAK-6q+iZfY=FyOxJfS7cY7MqScs+nU=U3B4NnLnvcLH3fofuAg@mail.gmail.com>
	<CAK-6q+ga2zT2h4oY0=aCXFeU=oaFHbSXGzuVRptB8Hg-YKR7Gw@mail.gmail.com>
	<CAK-6q+jfA2k1TFrLqK4YN2vshgLidD=6r_CCV6df_VRFMFO7ag@mail.gmail.com>
	<20220124201417.GI4285@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20220124201417.GI4285@paulmck-ThinkPad-P17-Gen-1>
From: Alexander Aring <aahringo@redhat.com>
Date: Mon, 24 Jan 2022 16:36:55 -0500
Message-ID: <CAK-6q+gGx68Wx8mBJAdo0ygpBWPoHW+L+HD11U6UQSOjSXVP3w@mail.gmail.com>
To: paulmck@kernel.org
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: rcu@vger.kernel.org, kbuild-all@lists.01.org,
	kernel test robot <lkp@intel.com>, Randy Dunlap <rdunlap@infradead.org>,
	linux-kernel@vger.kernel.org, cluster-devel <cluster-devel@redhat.com>,
	linux-sparse@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Mon, Jan 24, 2022 at 3:23 PM Paul E. McKenney <paulmck@kernel.org> wrote:
>
> On Mon, Jan 24, 2022 at 12:41:04PM -0500, Alexander Aring wrote:
> > Hi,
> >
> > On Mon, Jan 24, 2022 at 12:36 PM Alexander Aring <aahringo@redhat.com> wrote:
> > >
> > > Hi,
> > >
> > > On Mon, Jan 24, 2022 at 12:21 PM Alexander Aring <aahringo@redhat.com> wrote:
> > > >
> > > > Hi,
> > > >
> > > > On Mon, Jan 24, 2022 at 7:46 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > > > >
> > > > > On Sun, Jan 23, 2022 at 01:41:52PM -0500, Alexander Aring wrote:
> > > > > >
> > > > > > I see also:
> > > > > >
> > > > > > fs/dlm/midcomms.c:213:1: sparse: sparse: symbol
> > > > > > '__srcu_struct_nodes_srcu' was not declared. Should it be static?
> > > > > >
> > > > >
> > > > > Why not just do this?  (Untested.  Maybe I don't understand?)
> > > > >
> > > > > diff --git a/include/linux/srcutree.h b/include/linux/srcutree.h
> > > > > index cb1f4351e8ba..a164089abec4 100644
> > > > > --- a/include/linux/srcutree.h
> > > > > +++ b/include/linux/srcutree.h
> > > > > @@ -121,7 +121,7 @@ struct srcu_struct {
> > > > >  #ifdef MODULE
> > > > >  # define __DEFINE_SRCU(name, is_static)                                        \
> > > > >         is_static struct srcu_struct name;                              \
> > > > > -       struct srcu_struct * const __srcu_struct_##name                 \
> > > > > +       is_static struct srcu_struct * const __srcu_struct_##name       \
> > > > >                 __section("___srcu_struct_ptrs") = &name
> > > > >  #else
> > > > >  # define __DEFINE_SRCU(name, is_static)                                        \
> > > > >
> > > >
> > > > I tried it and yes it will fix the issue and introduce another one
> > > > about "is_static struct srcu_struct * const __srcu_struct_##name" is
> > > > unused ("-Wunused-const-variable").
> > > > I added a __maybe_unused after the introduced is_static and it seems
> > > > to fix the introduced issue, now it compiles and sparse is happy. I am
> > > > not sure if this is the right fix?
> > >
> > > it is obviously unused, but it has something to do with
> > > "__section("___srcu_struct_ptrs")" and during module loading it, I
> > > suppose, srcu tries to access it to find whatever needs to be
> > > registered?
> >
> > Sorry, but if this is true then it can't be declared as static... and
> > we are at the beginning again.
>
> Welcome to my world!!!  ;-)
>
> More seriously, thank you for chasing this down.  But would it work to
> add a declaration just before?
>

only if I add an "extern" in front of the declaration before, so it looks like:

extern struct srcu_struct * const __srcu_struct_##name;

(compile and sparse tested only)

- Alex

