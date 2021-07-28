Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 46C5A3D9727
	for <lists+cluster-devel@lfdr.de>; Wed, 28 Jul 2021 22:57:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1627505856;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=rJGkACfiw9zug01mW1Ob0ndIBRiyqy2y9gkvhIOsv6o=;
	b=TjyXZ0zkAf3FeqVBTY6sIfdWvQPXH/sbqJ4Cg45rS7g1mXeU207As36FzuQT5o6Xx2I5Lc
	9Q8wa3+MVaGzwPATgodjR31vNlTnXX86ovmMGXlUZHmbaHHSzZlKFhH2OhoWYdZ3n4bSPR
	ZwuT3KV1uZXWnjqGF++DA9Y5oKP8Wro=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-QCQ8eLPQPWm6ZSx4TP4j6w-1; Wed, 28 Jul 2021 16:57:34 -0400
X-MC-Unique: QCQ8eLPQPWm6ZSx4TP4j6w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF81D107ACF5;
	Wed, 28 Jul 2021 20:57:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B6E845D6AB;
	Wed, 28 Jul 2021 20:57:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7B2214BB7B;
	Wed, 28 Jul 2021 20:57:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16SKvUWf032601 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 28 Jul 2021 16:57:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E3268208BDDA; Wed, 28 Jul 2021 20:57:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DC825208DD8A
	for <cluster-devel@redhat.com>; Wed, 28 Jul 2021 20:57:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B37289C7DB
	for <cluster-devel@redhat.com>; Wed, 28 Jul 2021 20:57:26 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
	[209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-449-YVNecayuO1-X6WSERa4uKA-1; Wed, 28 Jul 2021 16:57:24 -0400
X-MC-Unique: YVNecayuO1-X6WSERa4uKA-1
Received: by mail-wr1-f69.google.com with SMTP id
	s22-20020adf97960000b02901535eae4100so1373621wrb.14
	for <cluster-devel@redhat.com>; Wed, 28 Jul 2021 13:57:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rJGkACfiw9zug01mW1Ob0ndIBRiyqy2y9gkvhIOsv6o=;
	b=rjZnRjafZZ8fsKxAybjd0d1jguzJztR65kRYg8rwYL6hS3KuV6ReHvpg2ixwV9cjNU
	gzTZhV540WuE071YX3o9dXDx8Jttfg45aaT0GfvP670WhGxHaSFNYWEs8DEugi2u+B0l
	E04/YiG5ufZkJMbKOYCYwNcZlmW1wEiLTpb1t+5Gpcisu63kR/f5TNiPSg9UCnHHRmgx
	QYec6Kx317a3gmgDCcx9yxnopV02fQnamQD2LyYfjA4a8dAnxWWLtdgYaxSfND4ltgEo
	kMDMFs1YZnvNURNwgo1RntFGDfQMdkaL3gx5WWaVyEmlJYXIqfbZQGYsBs6DhNoBSmC0
	Iimw==
X-Gm-Message-State: AOAM531INTrgMmB+1DF5w8e7yVjzQS0wRjlP/UOvLZLgpmp4o/DI0V7D
	qM6YcuTnM2gLBtEX1rjuZlB/tf9RvCtxLtIPiIk2MAkQE+NnK07t8s7t7qhxfCEoRhO9HP4hR96
	jcCJGYeiL1Mq1LJsqkV116JXhKH0FPKwQEYXR9g==
X-Received: by 2002:a1c:2282:: with SMTP id i124mr1421353wmi.166.1627505843813;
	Wed, 28 Jul 2021 13:57:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwyMewaXDLSiS0Uya+TS8wuqHyiE0zmSL5BoMU9S2XbtsW8uLjvUg2Bzum9vk6Rtmtbe3/A7F60kQRle2LhW8Y=
X-Received: by 2002:a1c:2282:: with SMTP id i124mr1421339wmi.166.1627505843645;
	Wed, 28 Jul 2021 13:57:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210727173709.210711-1-rpeterso@redhat.com>
	<20210727173709.210711-14-rpeterso@redhat.com>
	<CAHc6FU4MUkurXhtbRrwuF846Dz7eT9+RBFntEs+_bzV6YO=GSA@mail.gmail.com>
	<0d471fd4-05e7-8b8b-6bbb-55a7cd2e72a2@redhat.com>
In-Reply-To: <0d471fd4-05e7-8b8b-6bbb-55a7cd2e72a2@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 28 Jul 2021 22:57:12 +0200
Message-ID: <CAHc6FU5sqrqu85KO7hhoGz3GVMhaVO2rZxQ2VOB47NNmgo6M9Q@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH 13/15] gfs2: ignore
 usr|grp|prjquota mount options
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 28, 2021 at 10:33 PM Bob Peterson <rpeterso@redhat.com> wrote:
> On 7/28/21 1:28 PM, Andreas Gruenbacher wrote:
> > On Tue, Jul 27, 2021 at 7:37 PM Bob Peterson <rpeterso@redhat.com> wrote:
> >> Before this patch, gfs2 rejected mounts attempted with the usrquota,
> >> grpquota, or prjquota mount options. That caused numerous xfstests tests
> >> to fail. This patch allows gfs2 to accept but ignore those mount options
> >> so the tests may be run.
> >
> > We can't just fake this up. Instead, the fstests need to be fixed to
> > skip tests that don't run on particular filesystems.
> Hi Andreas,
>
> I see your point, and sure, the maintainers of xfstests can improve the
> tests to make them check whether the options are supported for gfs2 as
> they do with other some other options.
>
> Still, if you look at the man page for "mount(8)" under "Mount options
> for affs" you see:
>
> "grpquota|noquota|quota|usrquota
> These options are accepted but ignored.  (However, quota utilities may
> react to such strings in /etc/fstab.)"
>
> If you look at "Mount options for jfs" you similarly see:
>
> "noquota|quota|usrquota|grpquota
> These options are accepted but ignored."
>
> So if affs and jfs can ignore these mount options, why can't gfs2?
> Are we planning to support them ever?

Hmm, that's interesting. I don't know what to think about that.

Andreas

