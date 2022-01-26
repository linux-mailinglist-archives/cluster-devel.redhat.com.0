Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5B849CC86
	for <lists+cluster-devel@lfdr.de>; Wed, 26 Jan 2022 15:40:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643208028;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=hqZ5S1prQcULJgjev4pMri/oRUOkdQMRX3yC6zfVtIg=;
	b=h6UDf7HW/acub+ctFzn5J8v3DehiC8ykQ1KCrXC8ZuheLhjNQEWnMGB13FkiFcMdfJ8CG2
	wqmXoka/rByWL2iaLsM8jAHQK8oFD5hFoq+yJNYX/Ve7kh2TqaInArAlleCuCE8nxkt6GA
	i0XnQ49YwMaZVryQ9zlbmwjdIfX5WLU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-534-QPPpGS5YOF-v_AIKae3u1Q-1; Wed, 26 Jan 2022 09:40:24 -0500
X-MC-Unique: QPPpGS5YOF-v_AIKae3u1Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5BCCA86A8A1;
	Wed, 26 Jan 2022 14:40:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3CB677DE29;
	Wed, 26 Jan 2022 14:40:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 14BC74BB7C;
	Wed, 26 Jan 2022 14:40:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20QEe7BK014555 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 26 Jan 2022 09:40:07 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3636140CFD33; Wed, 26 Jan 2022 14:40:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3177C40CFD04
	for <cluster-devel@redhat.com>; Wed, 26 Jan 2022 14:40:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 17DEB381A3A1
	for <cluster-devel@redhat.com>; Wed, 26 Jan 2022 14:40:07 +0000 (UTC)
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
	[209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-418-l2gE3SBHMxC_Yve61Gkpnw-1; Wed, 26 Jan 2022 09:40:03 -0500
X-MC-Unique: l2gE3SBHMxC_Yve61Gkpnw-1
Received: by mail-qv1-f69.google.com with SMTP id
	kc19-20020a056214411300b00422b7cdea6eso11845499qvb.19
	for <cluster-devel@redhat.com>; Wed, 26 Jan 2022 06:40:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hqZ5S1prQcULJgjev4pMri/oRUOkdQMRX3yC6zfVtIg=;
	b=K+h9odsX5LlXWEZBPSp75Z5OQgB/1iCtF+pIJMrTb6DYxEpyoNOBmIYj5dfW73Hf8H
	QLiPAs8pgIk3HjpxusDDxzWeQgQZ9L3E9gA0od7ee5hTD7za/3ySPlGapW6v4qj3pah5
	ZG42PtXoxIDM5bsDpDXs3X5qD88kdT/xESJdbkHVqoZPVVWtmuNMwV29ePAxyy9/5DpP
	xUPNrn4nCe+RqTLEiXjvrXjjM1RgGXh3CkENbmq1NSqdVt4JdO7Mf38bFof9L0Roa1oV
	AJOBr9g4mSbxl1ZqY1NsnDvBlXyyDZeIGDeZlqKiufjCfhnm/vC3De0RBkYc0mNZJ788
	9v1Q==
X-Gm-Message-State: AOAM531HLQlS3bHJ0/HsnDccyPK2+O7OMExs3R8yPv91W1I6LnJcfeCR
	VE0fzKAvDrGlQ74F6hnQ+QQwt5dIS1rDIbcAtX8jdj8GS2160AFmZjt8v2P9Cy3oJht3Y6bylux
	/cVlrVW3VGGxtv2FduAbne6G6OvEDkrkWSpHWmQ==
X-Received: by 2002:a05:6214:21ef:: with SMTP id
	p15mr17778177qvj.92.1643208003246; 
	Wed, 26 Jan 2022 06:40:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyywkK5Wtoe5LXL+drsPdIe17bzNdMMNSpjrYtTkG1KAmitJKJB8fjznSP4WEioXe8AorW1rs112OFEWD2So/0=
X-Received: by 2002:a05:6214:21ef:: with SMTP id
	p15mr17778166qvj.92.1643208003014; 
	Wed, 26 Jan 2022 06:40:03 -0800 (PST)
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
	<CAK-6q+j-3CWEvbFVqxd-_rc67VBZHBXPbGOo5QfGUb_KFEf_FA@mail.gmail.com>
In-Reply-To: <CAK-6q+j-3CWEvbFVqxd-_rc67VBZHBXPbGOo5QfGUb_KFEf_FA@mail.gmail.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Wed, 26 Jan 2022 09:39:51 -0500
Message-ID: <CAK-6q+gye79SDL-zh6Uq_-oCa1gMELVi_riuqnBs-EPYfyNbow@mail.gmail.com>
To: paulmck@kernel.org
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Tue, Jan 25, 2022 at 5:35 PM Alexander Aring <aahringo@redhat.com> wrote:
>
> Hi,
>
> On Mon, Jan 24, 2022 at 5:14 PM Paul E. McKenney <paulmck@kernel.org> wrote:
> >
> > On Mon, Jan 24, 2022 at 04:36:55PM -0500, Alexander Aring wrote:
> > > Hi,
> > >
> > > On Mon, Jan 24, 2022 at 3:23 PM Paul E. McKenney <paulmck@kernel.org> wrote:
> > > >
> > > > On Mon, Jan 24, 2022 at 12:41:04PM -0500, Alexander Aring wrote:
> > > > > Hi,
> > > > >
> > > > > On Mon, Jan 24, 2022 at 12:36 PM Alexander Aring <aahringo@redhat.com> wrote:
> > > > > >
> > > > > > Hi,
> > > > > >
> > > > > > On Mon, Jan 24, 2022 at 12:21 PM Alexander Aring <aahringo@redhat.com> wrote:
> > > > > > >
> > > > > > > Hi,
> > > > > > >
> > > > > > > On Mon, Jan 24, 2022 at 7:46 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > > > > > > >
> > > > > > > > On Sun, Jan 23, 2022 at 01:41:52PM -0500, Alexander Aring wrote:
> > > > > > > > >
> > > > > > > > > I see also:
> > > > > > > > >
> > > > > > > > > fs/dlm/midcomms.c:213:1: sparse: sparse: symbol
> > > > > > > > > '__srcu_struct_nodes_srcu' was not declared. Should it be static?
> > > > > > > > >
> > > > > > > >
> > > > > > > > Why not just do this?  (Untested.  Maybe I don't understand?)
> > > > > > > >
> > > > > > > > diff --git a/include/linux/srcutree.h b/include/linux/srcutree.h
> > > > > > > > index cb1f4351e8ba..a164089abec4 100644
> > > > > > > > --- a/include/linux/srcutree.h
> > > > > > > > +++ b/include/linux/srcutree.h
> > > > > > > > @@ -121,7 +121,7 @@ struct srcu_struct {
> > > > > > > >  #ifdef MODULE
> > > > > > > >  # define __DEFINE_SRCU(name, is_static)                                        \
> > > > > > > >         is_static struct srcu_struct name;                              \
> > > > > > > > -       struct srcu_struct * const __srcu_struct_##name                 \
> > > > > > > > +       is_static struct srcu_struct * const __srcu_struct_##name       \
> > > > > > > >                 __section("___srcu_struct_ptrs") = &name
> > > > > > > >  #else
> > > > > > > >  # define __DEFINE_SRCU(name, is_static)                                        \
> > > > > > > >
> > > > > > >
> > > > > > > I tried it and yes it will fix the issue and introduce another one
> > > > > > > about "is_static struct srcu_struct * const __srcu_struct_##name" is
> > > > > > > unused ("-Wunused-const-variable").
> > > > > > > I added a __maybe_unused after the introduced is_static and it seems
> > > > > > > to fix the introduced issue, now it compiles and sparse is happy. I am
> > > > > > > not sure if this is the right fix?
> > > > > >
> > > > > > it is obviously unused, but it has something to do with
> > > > > > "__section("___srcu_struct_ptrs")" and during module loading it, I
> > > > > > suppose, srcu tries to access it to find whatever needs to be
> > > > > > registered?
> > > > >
> > > > > Sorry, but if this is true then it can't be declared as static... and
> > > > > we are at the beginning again.
> > > >
> > > > Welcome to my world!!!  ;-)
> > > >
> > > > More seriously, thank you for chasing this down.  But would it work to
> > > > add a declaration just before?
> > > >
> > >
> > > only if I add an "extern" in front of the declaration before, so it looks like:
> > >
> > > extern struct srcu_struct * const __srcu_struct_##name;
> > >
> > > (compile and sparse tested only)
> >
> > If that works for everyone, it seems worth persuing.
> >
> > One way to test this is as follows:
> >
> > 1.      Build a kernel with CONFIG_RCU_TORTURE_TEST=m.  Boot this and
> >         type "modprobe rcutorture torture_type=srcu".
> >
> >         If you want to stop the torture test, type "rmmod rcutorture".
> >
> >         This will test DEFINE_SRCU() for the module case.
> >
>
> I tested this case, I still need to do the 2. case. Sorry I am quite
> busy with something else, but I am still working on it.
>

I did the 2. test successful...:
"tools/testing/selftests/rcutorture/bin/kvm.sh --allcpus --duration 3
--configs 'SRCU-N' --trust-make"
but I was required to hack it because my "qemu-system-x86_64" did not
exist, it was "/usr/libexec/qemu-kvm" (it was able to run by just
doing a symlink). I think I already cc'd the right people to report
this issue (rcu subsystem)...

I will send a patch for the export declaration soon as possible.

- Alex

