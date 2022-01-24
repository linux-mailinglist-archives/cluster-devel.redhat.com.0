Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F202498722
	for <lists+cluster-devel@lfdr.de>; Mon, 24 Jan 2022 18:41:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643046086;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=KLmnh7F+9qnrIKW2UFS2DJy4bOHo/tjVCSEI8rXwkN0=;
	b=Bo5JykWV926x9nOPlsRNHGK9diHDCmjOeIY08nIpnSg7EqRwkbOk+9wv0H4RydjsCSR6iT
	964rDOqe2sm7tHrl49wPH3FDY1HRzSvBClkDi+7+LLonPA2TABbdazmFQF+yIlsldoTUO2
	nY4QaNgpPSav+v6Le3QfyqrIwIEiYpc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-dBROr-hxPASNNTI8zx62Cg-1; Mon, 24 Jan 2022 12:41:23 -0500
X-MC-Unique: dBROr-hxPASNNTI8zx62Cg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC3A21091DA8;
	Mon, 24 Jan 2022 17:41:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 836F52E05C;
	Mon, 24 Jan 2022 17:41:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6FCFC4BB7B;
	Mon, 24 Jan 2022 17:41:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20OHfJQV001885 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 24 Jan 2022 12:41:19 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E68D340CFD13; Mon, 24 Jan 2022 17:41:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E2A5240CFD0C
	for <cluster-devel@redhat.com>; Mon, 24 Jan 2022 17:41:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C9A6A2B76026
	for <cluster-devel@redhat.com>; Mon, 24 Jan 2022 17:41:18 +0000 (UTC)
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
	[209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-228-2DmHpt6GMh-OJP9yUH--qA-1; Mon, 24 Jan 2022 12:41:15 -0500
X-MC-Unique: 2DmHpt6GMh-OJP9yUH--qA-1
Received: by mail-qt1-f200.google.com with SMTP id
	c15-20020ac87dcf000000b002d0a849c0beso1193279qte.16
	for <cluster-devel@redhat.com>; Mon, 24 Jan 2022 09:41:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KLmnh7F+9qnrIKW2UFS2DJy4bOHo/tjVCSEI8rXwkN0=;
	b=nTAHY11iATL3WaAU5zwnMadsdhXtfbpEUY4KvP8xlMbHPoFYPGc0MKsQC+q2vpkbWO
	qj7v6hHg/OOopdm0bBhRDCSaTepcMOuunsVG1JjC9rjGkyTSlTRAbWkxRQDJq7BBFOeV
	joGicJufe4BtTUnt4LfEQLQueQoLI0F0k63XcZQ54/CQmhTrjTJlqVHYqHvY+QZ+sCVb
	RM/WjiyAz2Rj4R2MuiwkOP63kXogLw1uJeAnU2CbkAtA39l2ax2jQ4eQPs2t6tOmgIvW
	zJCp1/7k50v0unronpciqmV0PHFIfmLsh4SmUYlHTMCIiNEmBmAw3iYwTd92oL/RAPxM
	uQWg==
X-Gm-Message-State: AOAM533OH3s0zdyECJqyWEueko6VxvfW1HfqtSlw3bYM5SINkt44ZXLI
	p279Ror5WMX0ge5NKWCN2DFsYyVVZFK4in336v8skjqdliR0H+qPr8tMk7XVi04loKvv+Sr9IYJ
	5AHvwSn63nJ3zbSfTVCMxDuLP/LFTiSFfX6vXpA==
X-Received: by 2002:a05:6214:21ae:: with SMTP id
	t14mr5880995qvc.59.1643046075041; 
	Mon, 24 Jan 2022 09:41:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzmZ0zoLxqMaj4sgRawFKfYQmeh7BxLZQUfotyGdGqOmghwyprTfohZ9jYN68ECfTUFCiv5VLMuukYTQwYO+9A=
X-Received: by 2002:a05:6214:21ae:: with SMTP id
	t14mr5880983qvc.59.1643046074838; 
	Mon, 24 Jan 2022 09:41:14 -0800 (PST)
MIME-Version: 1.0
References: <202201221028.YKA8kSdm-lkp@intel.com>
	<CAK-6q+h_hb94J3DSXPk=E44kCxiwZ+BE3kMJe09iShRzMb=vzQ@mail.gmail.com>
	<91901e7b-7d82-116c-aaf2-c74c6a6b999c@infradead.org>
	<CAK-6q+j2jc3pBmbvQ-DCmxveC-UMV75SFc2nC1zwXKe9wm4YPg@mail.gmail.com>
	<20220124124530.GS1951@kadam>
	<CAK-6q+iZfY=FyOxJfS7cY7MqScs+nU=U3B4NnLnvcLH3fofuAg@mail.gmail.com>
	<CAK-6q+ga2zT2h4oY0=aCXFeU=oaFHbSXGzuVRptB8Hg-YKR7Gw@mail.gmail.com>
In-Reply-To: <CAK-6q+ga2zT2h4oY0=aCXFeU=oaFHbSXGzuVRptB8Hg-YKR7Gw@mail.gmail.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Mon, 24 Jan 2022 12:41:04 -0500
Message-ID: <CAK-6q+jfA2k1TFrLqK4YN2vshgLidD=6r_CCV6df_VRFMFO7ag@mail.gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Mon, Jan 24, 2022 at 12:36 PM Alexander Aring <aahringo@redhat.com> wrote:
>
> Hi,
>
> On Mon, Jan 24, 2022 at 12:21 PM Alexander Aring <aahringo@redhat.com> wrote:
> >
> > Hi,
> >
> > On Mon, Jan 24, 2022 at 7:46 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > >
> > > On Sun, Jan 23, 2022 at 01:41:52PM -0500, Alexander Aring wrote:
> > > >
> > > > I see also:
> > > >
> > > > fs/dlm/midcomms.c:213:1: sparse: sparse: symbol
> > > > '__srcu_struct_nodes_srcu' was not declared. Should it be static?
> > > >
> > >
> > > Why not just do this?  (Untested.  Maybe I don't understand?)
> > >
> > > diff --git a/include/linux/srcutree.h b/include/linux/srcutree.h
> > > index cb1f4351e8ba..a164089abec4 100644
> > > --- a/include/linux/srcutree.h
> > > +++ b/include/linux/srcutree.h
> > > @@ -121,7 +121,7 @@ struct srcu_struct {
> > >  #ifdef MODULE
> > >  # define __DEFINE_SRCU(name, is_static)                                        \
> > >         is_static struct srcu_struct name;                              \
> > > -       struct srcu_struct * const __srcu_struct_##name                 \
> > > +       is_static struct srcu_struct * const __srcu_struct_##name       \
> > >                 __section("___srcu_struct_ptrs") = &name
> > >  #else
> > >  # define __DEFINE_SRCU(name, is_static)                                        \
> > >
> >
> > I tried it and yes it will fix the issue and introduce another one
> > about "is_static struct srcu_struct * const __srcu_struct_##name" is
> > unused ("-Wunused-const-variable").
> > I added a __maybe_unused after the introduced is_static and it seems
> > to fix the introduced issue, now it compiles and sparse is happy. I am
> > not sure if this is the right fix?
>
> it is obviously unused, but it has something to do with
> "__section("___srcu_struct_ptrs")" and during module loading it, I
> suppose, srcu tries to access it to find whatever needs to be
> registered?

Sorry, but if this is true then it can't be declared as static... and
we are at the beginning again.

- Alex

