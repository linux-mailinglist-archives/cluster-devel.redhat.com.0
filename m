Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B734986D7
	for <lists+cluster-devel@lfdr.de>; Mon, 24 Jan 2022 18:32:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643045528;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=i1S3g+b7br3s08Re9KUAkuBGZDRyz6Chv3XkAdUIT9o=;
	b=KBrDShaUKviOwu9+QNfKjwpRIAtjg7p18myo5v1s+hiJGzDZNDGHaVz6sxdHqSIHr84cvP
	5qwEBntZgyOb2NthX0MDhg0LaleqA3N+vdzk1MhseO+1PszIKoYc8qmYRXDGwqRwzHE7pj
	zrsIeuL9eY3axYhbyUCAEJ/i7C4Lmu0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-7n592ke0NQWWHFUyOqqn8Q-1; Mon, 24 Jan 2022 12:32:00 -0500
X-MC-Unique: 7n592ke0NQWWHFUyOqqn8Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD052760C5;
	Mon, 24 Jan 2022 17:31:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ACC7C10D48EA;
	Mon, 24 Jan 2022 17:31:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 554A81806D1D;
	Mon, 24 Jan 2022 17:31:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
	[10.11.54.9])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20OHMBuK029635 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 24 Jan 2022 12:22:11 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 19B39492D18; Mon, 24 Jan 2022 17:22:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1627E492CB1
	for <cluster-devel@redhat.com>; Mon, 24 Jan 2022 17:22:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F011E811E7A
	for <cluster-devel@redhat.com>; Mon, 24 Jan 2022 17:22:10 +0000 (UTC)
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
	[209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-96-vd-LY2_xPqWSdV10siuG7Q-1; Mon, 24 Jan 2022 12:22:07 -0500
X-MC-Unique: vd-LY2_xPqWSdV10siuG7Q-1
Received: by mail-qk1-f197.google.com with SMTP id
	q5-20020a05620a0d8500b004738c1b48beso12764841qkl.7
	for <cluster-devel@redhat.com>; Mon, 24 Jan 2022 09:22:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=i1S3g+b7br3s08Re9KUAkuBGZDRyz6Chv3XkAdUIT9o=;
	b=k/e2exwL+vukAHyz/TDozhIzfrouw39MuMgukbu+btOd/WKtB5BBztQcT8HhOckcJy
	PTQSrTPMP1ETpI5PDRgJLF25c3/LOqlxv7EIus44BoS4im0NRuIU373xjz5qP0rT4zxy
	HUiSEoMlIUGzM0LYpchvAxJxIG9D6hUcjRsGguSSodC8BOlzzTKuXUi8uDr2HE3SHqec
	LpdkzupylagjTA5/SnzECtv72NPxgHDYhJe7YHfyNlhCUUUXUJG98F8O0aghhvybGjlW
	51+4NCtEIREMhs2LjajLaK7K0g+3qetvWoKtV2jzXr6SAd8P24TEqRo/vICidF0initR
	TiHw==
X-Gm-Message-State: AOAM531V6l/KQRb/8ZwOsdIPJZ4e++bPNO9Dv67eWIj+7bAuNNM1jYO4
	rMjH1ZFEN0O1fZoTd/2OfNR7bUESwP/ZjSM27gAmnGv6/w/QjAPO2Q3oQMFEilLgEpxqOscAM0k
	IvoBRracql9tjNABvZypHPxyKTw1gUA1aANzXOg==
X-Received: by 2002:a37:bd86:: with SMTP id
	n128mr11660102qkf.770.1643044927254; 
	Mon, 24 Jan 2022 09:22:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxUimEDbi3foNski3m2mUz0H6FU6LVnCqDgmmWfF0KbAU4PZJm+/5jDqGBmK60YY0A94WZuVtb8Flw59Rfx47E=
X-Received: by 2002:a37:bd86:: with SMTP id
	n128mr11660087qkf.770.1643044927010; 
	Mon, 24 Jan 2022 09:22:07 -0800 (PST)
MIME-Version: 1.0
References: <202201221028.YKA8kSdm-lkp@intel.com>
	<CAK-6q+h_hb94J3DSXPk=E44kCxiwZ+BE3kMJe09iShRzMb=vzQ@mail.gmail.com>
	<91901e7b-7d82-116c-aaf2-c74c6a6b999c@infradead.org>
	<CAK-6q+j2jc3pBmbvQ-DCmxveC-UMV75SFc2nC1zwXKe9wm4YPg@mail.gmail.com>
	<20220124124530.GS1951@kadam>
In-Reply-To: <20220124124530.GS1951@kadam>
From: Alexander Aring <aahringo@redhat.com>
Date: Mon, 24 Jan 2022 12:21:55 -0500
Message-ID: <CAK-6q+iZfY=FyOxJfS7cY7MqScs+nU=U3B4NnLnvcLH3fofuAg@mail.gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Mon, Jan 24, 2022 at 7:46 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Sun, Jan 23, 2022 at 01:41:52PM -0500, Alexander Aring wrote:
> >
> > I see also:
> >
> > fs/dlm/midcomms.c:213:1: sparse: sparse: symbol
> > '__srcu_struct_nodes_srcu' was not declared. Should it be static?
> >
>
> Why not just do this?  (Untested.  Maybe I don't understand?)
>
> diff --git a/include/linux/srcutree.h b/include/linux/srcutree.h
> index cb1f4351e8ba..a164089abec4 100644
> --- a/include/linux/srcutree.h
> +++ b/include/linux/srcutree.h
> @@ -121,7 +121,7 @@ struct srcu_struct {
>  #ifdef MODULE
>  # define __DEFINE_SRCU(name, is_static)                                        \
>         is_static struct srcu_struct name;                              \
> -       struct srcu_struct * const __srcu_struct_##name                 \
> +       is_static struct srcu_struct * const __srcu_struct_##name       \
>                 __section("___srcu_struct_ptrs") = &name
>  #else
>  # define __DEFINE_SRCU(name, is_static)                                        \
>

I tried it and yes it will fix the issue and introduce another one
about "is_static struct srcu_struct * const __srcu_struct_##name" is
unused ("-Wunused-const-variable").
I added a __maybe_unused after the introduced is_static and it seems
to fix the introduced issue, now it compiles and sparse is happy. I am
not sure if this is the right fix?

- Alex

