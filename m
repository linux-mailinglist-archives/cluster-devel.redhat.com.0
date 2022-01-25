Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F8249BE9B
	for <lists+cluster-devel@lfdr.de>; Tue, 25 Jan 2022 23:35:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643150153;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=k75gNnN2Y4rsFZzI0W9vLCBJnfGQeUey/CI75tOWNFw=;
	b=boUqGy6ZhV/UR62LjW7QaM1LRjCd1OLhHhYLWEN4x4AsbjwY1s+/GvfRugZw9Z5nIkznpU
	q2DAymdwu5qlQaWRXomSl+w133y1cozGNYtmt3iL2sMwl627gBUePVhj8/eVjgsJ8wDLif
	tnO6soqk7PTf28xcLxCBMXLiCz23H5I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-115-9BaWKww9OzWsDYGWZPtQdQ-1; Tue, 25 Jan 2022 17:35:50 -0500
X-MC-Unique: 9BaWKww9OzWsDYGWZPtQdQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC43346860;
	Tue, 25 Jan 2022 22:35:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 906A75DB88;
	Tue, 25 Jan 2022 22:35:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 514EA4BB7C;
	Tue, 25 Jan 2022 22:35:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
	[10.11.54.7])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20PMZZP7001820 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 25 Jan 2022 17:35:35 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 97024141DEE2; Tue, 25 Jan 2022 22:35:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9284B141DED5
	for <cluster-devel@redhat.com>; Tue, 25 Jan 2022 22:35:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 766F8185A7B2
	for <cluster-devel@redhat.com>; Tue, 25 Jan 2022 22:35:35 +0000 (UTC)
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
	[209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-665-0lv6RXO2OQK0liQKsMqY1Q-1; Tue, 25 Jan 2022 17:35:33 -0500
X-MC-Unique: 0lv6RXO2OQK0liQKsMqY1Q-1
Received: by mail-lj1-f197.google.com with SMTP id
	a13-20020a2e88cd000000b002386c61ffe2so3196208ljk.7
	for <cluster-devel@redhat.com>; Tue, 25 Jan 2022 14:35:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=k75gNnN2Y4rsFZzI0W9vLCBJnfGQeUey/CI75tOWNFw=;
	b=01povao+JlkU22JcYLqpw5HySFvFv7gPja/367Bh7LqtwcthP7qJ+w+Od7P6f23nbF
	j3E+iFuHltBwjDjp80Xf92UeAz2szSkpxrUUChabgV3KYpyeMJEev8smBpVwUXaWBfb4
	7iYIJ5ThtJ4KHDEq5l90MSRglEeP2I1xMeHdUe5yk2pPCedMy/9W4W6rTzuyJNK5pbNy
	A3QuGjbgR8FIJMuXVabk6olgIurnIswlMdrph6YWYPANJX8PAAhLzqAG2Vjw5072+hGz
	5CKkBJ+sEkt02TNCQMbskAhIpYDRZwrfsJs8XOzzU4XIb4YLqnQoOgMd+EKYVQAoO7gj
	FXBw==
X-Gm-Message-State: AOAM53375w4Jx60WPoD6u7AsREKqTFqCaOz0z/k0ba+Z6sSks2Mguixl
	n9Xh3sGAlxRgIrBPGOfebQuP2EAFNj/hkDOjkML5rYm3dYDsSSzgPSvgRzbDz0i79TG0Hb8FVhQ
	5aEOt4LWTyW2j+odRnXuTU5CLpOdldY3S3VjlbA==
X-Received: by 2002:a05:6512:3d03:: with SMTP id
	d3mr8952707lfv.379.1643150132390; 
	Tue, 25 Jan 2022 14:35:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx9fbIP0TOF/WUCcVN6pugV7F0H0bowPMTO+fLMT9bbADztVRjFSViN9p2AMb5vUvnVWT9NG78ueV8BTeNcdSs=
X-Received: by 2002:a05:6512:3d03:: with SMTP id
	d3mr8952690lfv.379.1643150132181; 
	Tue, 25 Jan 2022 14:35:32 -0800 (PST)
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
	<CAK-6q+gGx68Wx8mBJAdo0ygpBWPoHW+L+HD11U6UQSOjSXVP3w@mail.gmail.com>
	<20220124220628.GL4285@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20220124220628.GL4285@paulmck-ThinkPad-P17-Gen-1>
From: Alexander Aring <aahringo@redhat.com>
Date: Tue, 25 Jan 2022 17:35:20 -0500
Message-ID: <CAK-6q+j-3CWEvbFVqxd-_rc67VBZHBXPbGOo5QfGUb_KFEf_FA@mail.gmail.com>
To: paulmck@kernel.org
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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

On Mon, Jan 24, 2022 at 5:14 PM Paul E. McKenney <paulmck@kernel.org> wrote:
>
> On Mon, Jan 24, 2022 at 04:36:55PM -0500, Alexander Aring wrote:
> > Hi,
> >
> > On Mon, Jan 24, 2022 at 3:23 PM Paul E. McKenney <paulmck@kernel.org> wrote:
> > >
> > > On Mon, Jan 24, 2022 at 12:41:04PM -0500, Alexander Aring wrote:
> > > > Hi,
> > > >
> > > > On Mon, Jan 24, 2022 at 12:36 PM Alexander Aring <aahringo@redhat.com> wrote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > On Mon, Jan 24, 2022 at 12:21 PM Alexander Aring <aahringo@redhat.com> wrote:
> > > > > >
> > > > > > Hi,
> > > > > >
> > > > > > On Mon, Jan 24, 2022 at 7:46 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > > > > > >
> > > > > > > On Sun, Jan 23, 2022 at 01:41:52PM -0500, Alexander Aring wrote:
> > > > > > > >
> > > > > > > > I see also:
> > > > > > > >
> > > > > > > > fs/dlm/midcomms.c:213:1: sparse: sparse: symbol
> > > > > > > > '__srcu_struct_nodes_srcu' was not declared. Should it be static?
> > > > > > > >
> > > > > > >
> > > > > > > Why not just do this?  (Untested.  Maybe I don't understand?)
> > > > > > >
> > > > > > > diff --git a/include/linux/srcutree.h b/include/linux/srcutree.h
> > > > > > > index cb1f4351e8ba..a164089abec4 100644
> > > > > > > --- a/include/linux/srcutree.h
> > > > > > > +++ b/include/linux/srcutree.h
> > > > > > > @@ -121,7 +121,7 @@ struct srcu_struct {
> > > > > > >  #ifdef MODULE
> > > > > > >  # define __DEFINE_SRCU(name, is_static)                                        \
> > > > > > >         is_static struct srcu_struct name;                              \
> > > > > > > -       struct srcu_struct * const __srcu_struct_##name                 \
> > > > > > > +       is_static struct srcu_struct * const __srcu_struct_##name       \
> > > > > > >                 __section("___srcu_struct_ptrs") = &name
> > > > > > >  #else
> > > > > > >  # define __DEFINE_SRCU(name, is_static)                                        \
> > > > > > >
> > > > > >
> > > > > > I tried it and yes it will fix the issue and introduce another one
> > > > > > about "is_static struct srcu_struct * const __srcu_struct_##name" is
> > > > > > unused ("-Wunused-const-variable").
> > > > > > I added a __maybe_unused after the introduced is_static and it seems
> > > > > > to fix the introduced issue, now it compiles and sparse is happy. I am
> > > > > > not sure if this is the right fix?
> > > > >
> > > > > it is obviously unused, but it has something to do with
> > > > > "__section("___srcu_struct_ptrs")" and during module loading it, I
> > > > > suppose, srcu tries to access it to find whatever needs to be
> > > > > registered?
> > > >
> > > > Sorry, but if this is true then it can't be declared as static... and
> > > > we are at the beginning again.
> > >
> > > Welcome to my world!!!  ;-)
> > >
> > > More seriously, thank you for chasing this down.  But would it work to
> > > add a declaration just before?
> > >
> >
> > only if I add an "extern" in front of the declaration before, so it looks like:
> >
> > extern struct srcu_struct * const __srcu_struct_##name;
> >
> > (compile and sparse tested only)
>
> If that works for everyone, it seems worth persuing.
>
> One way to test this is as follows:
>
> 1.      Build a kernel with CONFIG_RCU_TORTURE_TEST=m.  Boot this and
>         type "modprobe rcutorture torture_type=srcu".
>
>         If you want to stop the torture test, type "rmmod rcutorture".
>
>         This will test DEFINE_SRCU() for the module case.
>

I tested this case, I still need to do the 2. case. Sorry I am quite
busy with something else, but I am still working on it.

Thanks.

- Alex

