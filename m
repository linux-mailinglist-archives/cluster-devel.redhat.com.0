Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A97F49B13F
	for <lists+cluster-devel@lfdr.de>; Tue, 25 Jan 2022 11:24:18 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-wNjSvpHhPfCry-vWLUWagg-1; Tue, 25 Jan 2022 05:24:14 -0500
X-MC-Unique: wNjSvpHhPfCry-vWLUWagg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 123ED100CCC2;
	Tue, 25 Jan 2022 10:24:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B71A66E05;
	Tue, 25 Jan 2022 10:24:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 169E01809CB8;
	Tue, 25 Jan 2022 10:24:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20OME2b1024641 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 24 Jan 2022 17:14:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6DAAC404727C; Mon, 24 Jan 2022 22:14:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 69F494047272
	for <cluster-devel@redhat.com>; Mon, 24 Jan 2022 22:14:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 520B6803DDA
	for <cluster-devel@redhat.com>; Mon, 24 Jan 2022 22:14:02 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
	[139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-52-MTIbQewVOw6A4XZzndhI3g-1; Mon, 24 Jan 2022 17:13:58 -0500
X-MC-Unique: MTIbQewVOw6A4XZzndhI3g-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9B1B0615F3;
	Mon, 24 Jan 2022 22:06:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ACCBC340F8;
	Mon, 24 Jan 2022 22:06:29 +0000 (UTC)
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id DDF295C0FCD; Mon, 24 Jan 2022 14:06:28 -0800 (PST)
Date: Mon, 24 Jan 2022 14:06:28 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Alexander Aring <aahringo@redhat.com>
Message-ID: <20220124220628.GL4285@paulmck-ThinkPad-P17-Gen-1>
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
MIME-Version: 1.0
In-Reply-To: <CAK-6q+gGx68Wx8mBJAdo0ygpBWPoHW+L+HD11U6UQSOjSXVP3w@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Tue, 25 Jan 2022 05:21:52 -0500
Cc: rcu@vger.kernel.org, kbuild-all@lists.01.org,
	kernel test robot <lkp@intel.com>, Randy Dunlap <rdunlap@infradead.org>,
	linux-kernel@vger.kernel.org, cluster-devel <cluster-devel@redhat.com>,
	linux-sparse@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [Cluster-devel] fs/dlm/midcomms.c:913:22: sparse: sparse:
 restricted __le32 degrades to integer
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: paulmck@kernel.org
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 24, 2022 at 04:36:55PM -0500, Alexander Aring wrote:
> Hi,
> 
> On Mon, Jan 24, 2022 at 3:23 PM Paul E. McKenney <paulmck@kernel.org> wrote:
> >
> > On Mon, Jan 24, 2022 at 12:41:04PM -0500, Alexander Aring wrote:
> > > Hi,
> > >
> > > On Mon, Jan 24, 2022 at 12:36 PM Alexander Aring <aahringo@redhat.com> wrote:
> > > >
> > > > Hi,
> > > >
> > > > On Mon, Jan 24, 2022 at 12:21 PM Alexander Aring <aahringo@redhat.com> wrote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > On Mon, Jan 24, 2022 at 7:46 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > > > > >
> > > > > > On Sun, Jan 23, 2022 at 01:41:52PM -0500, Alexander Aring wrote:
> > > > > > >
> > > > > > > I see also:
> > > > > > >
> > > > > > > fs/dlm/midcomms.c:213:1: sparse: sparse: symbol
> > > > > > > '__srcu_struct_nodes_srcu' was not declared. Should it be static?
> > > > > > >
> > > > > >
> > > > > > Why not just do this?  (Untested.  Maybe I don't understand?)
> > > > > >
> > > > > > diff --git a/include/linux/srcutree.h b/include/linux/srcutree.h
> > > > > > index cb1f4351e8ba..a164089abec4 100644
> > > > > > --- a/include/linux/srcutree.h
> > > > > > +++ b/include/linux/srcutree.h
> > > > > > @@ -121,7 +121,7 @@ struct srcu_struct {
> > > > > >  #ifdef MODULE
> > > > > >  # define __DEFINE_SRCU(name, is_static)                                        \
> > > > > >         is_static struct srcu_struct name;                              \
> > > > > > -       struct srcu_struct * const __srcu_struct_##name                 \
> > > > > > +       is_static struct srcu_struct * const __srcu_struct_##name       \
> > > > > >                 __section("___srcu_struct_ptrs") = &name
> > > > > >  #else
> > > > > >  # define __DEFINE_SRCU(name, is_static)                                        \
> > > > > >
> > > > >
> > > > > I tried it and yes it will fix the issue and introduce another one
> > > > > about "is_static struct srcu_struct * const __srcu_struct_##name" is
> > > > > unused ("-Wunused-const-variable").
> > > > > I added a __maybe_unused after the introduced is_static and it seems
> > > > > to fix the introduced issue, now it compiles and sparse is happy. I am
> > > > > not sure if this is the right fix?
> > > >
> > > > it is obviously unused, but it has something to do with
> > > > "__section("___srcu_struct_ptrs")" and during module loading it, I
> > > > suppose, srcu tries to access it to find whatever needs to be
> > > > registered?
> > >
> > > Sorry, but if this is true then it can't be declared as static... and
> > > we are at the beginning again.
> >
> > Welcome to my world!!!  ;-)
> >
> > More seriously, thank you for chasing this down.  But would it work to
> > add a declaration just before?
> >
> 
> only if I add an "extern" in front of the declaration before, so it looks like:
> 
> extern struct srcu_struct * const __srcu_struct_##name;
> 
> (compile and sparse tested only)

If that works for everyone, it seems worth persuing.

One way to test this is as follows:

1.	Build a kernel with CONFIG_RCU_TORTURE_TEST=m.  Boot this and
	type "modprobe rcutorture torture_type=srcu".

	If you want to stop the torture test, type "rmmod rcutorture".

	This will test DEFINE_SRCU() for the module case.

2.	At the top-level directory of your Linux-kernel source tree,
	type "tools/testing/selftests/rcutorture/bin/kvm.sh --allcpus --duration 3 --configs 'SRCU-N' --trust-make"

	This will test DEFINE_SRCU() for the non-module case.

If those both work, and if there are no other objections or complications,
please do send a patch.

							Thanx, Paul

