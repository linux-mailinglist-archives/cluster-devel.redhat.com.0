Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id A59B013BC63
	for <lists+cluster-devel@lfdr.de>; Wed, 15 Jan 2020 10:24:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579080286;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7jd5F/czqPHVs3DKaBrVU23W5C9niht3+HViBB7JpAs=;
	b=GReBzoFYMKlSl+3kHl2G6I90wMT6yHsF2TwYiHap6TqNN84SiR6e5/Adl6uyI/GgURcjtw
	VviKE5R6ioaWAlxKvMhZ/q+3q2u4TsqpPROxS9syOjX9/LL3gS7bv7t4PSwvI4CqK6vILt
	/JcaOxqsnANQ1UX0T5gMs2REHBJB8UU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-q0SKhXsNMfukE6s8xHgf6A-1; Wed, 15 Jan 2020 04:24:45 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A6B5B800D41;
	Wed, 15 Jan 2020 09:24:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 146D36609E;
	Wed, 15 Jan 2020 09:24:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 088FC18095FF;
	Wed, 15 Jan 2020 09:24:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00F9OcNw020753 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 15 Jan 2020 04:24:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A77B71004C5D; Wed, 15 Jan 2020 09:24:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A30DE1004C6D
	for <cluster-devel@redhat.com>; Wed, 15 Jan 2020 09:24:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD445101D24C
	for <cluster-devel@redhat.com>; Wed, 15 Jan 2020 09:24:36 +0000 (UTC)
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
	[209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-60-axiiDeahNdGvd1fXeXi9aA-1; Wed, 15 Jan 2020 04:24:35 -0500
Received: by mail-ot1-f70.google.com with SMTP id o14so9579342otp.4
	for <cluster-devel@redhat.com>; Wed, 15 Jan 2020 01:24:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uXXKwLMEF6E7V4wspViDiNnHKSg3dkM8l9CIRDeO9RA=;
	b=M85lDPSZWpl2buQo/NAa3tKS3hJQlxyelEK/eZhNqPcQxWsXJ3crrqmjSTd8v+4/DI
	zVD1tDgHkJICRRKP8cyepAQaYBBlg8dR1dPwK6AOXJYLCFarJ7LJD1XeuxxIrxDdFM/+
	+QmZWUECUiQY5FpBkqWidTMq1SDtFfog8BoudU3d0NRo89T5lwloamqlrBtH01ClnDMI
	MiMobQGi3sJzmhRWxt1IXDggSqpLDweBHCBBPmiwNBlukcVAZEevSclnDF4TWqFwVgMO
	cFnlx9HtHHXCeZsrs7t284BZo5jNMaW6uEhaDAfJMoejsqZPtjSlVX9y+St2LghmlicH
	zwxA==
X-Gm-Message-State: APjAAAWkFFdz+GqqroxOOAHPt6xNNDfhnN7UGfEGKalbK0RYnUAvxM8b
	N8PuWpeSaIYHVpwFmL7Pp4Gz3YX9/saST7TUqTbspLPj+vNlQOgxZeVk2HiLzBd9erV9cCYtpzo
	h1tPeDygCgBBGT1UoNrW/aynMf9r7lkQoN02v5w==
X-Received: by 2002:a9d:4c94:: with SMTP id m20mr2107347otf.341.1579080274501; 
	Wed, 15 Jan 2020 01:24:34 -0800 (PST)
X-Google-Smtp-Source: APXvYqzHSJCkmuH6aPGV39ibKKul6Bh5+3tcfAEHLlVHLfem91JJvd0zuzSFK/CYZsGho/tSepR7Y9zIN/m3quSjA50=
X-Received: by 2002:a9d:4c94:: with SMTP id m20mr2107338otf.341.1579080274255; 
	Wed, 15 Jan 2020 01:24:34 -0800 (PST)
MIME-Version: 1.0
References: <20200115084956.7405-1-agruenba@redhat.com>
	<d7d86bca-522a-48f5-bee3-bae50cd04485@redhat.com>
In-Reply-To: <d7d86bca-522a-48f5-bee3-bae50cd04485@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 15 Jan 2020 10:24:23 +0100
Message-ID: <CAHc6FU6UrNOenH6swABCOU2ZTh5NUfns-QeA29PSDsMwxFA1sQ@mail.gmail.com>
To: Steven Whitehouse <swhiteho@redhat.com>
X-MC-Unique: axiiDeahNdGvd1fXeXi9aA-1
X-MC-Unique: q0SKhXsNMfukE6s8xHgf6A-1
X-Mimecast-Originator: redhat.com
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00F9OcNw020753
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [PATCH] Move struct gfs2_rgrp_lvb out of
	gfs2_ondisk.h
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2020 at 9:58 AM Steven Whitehouse <swhiteho@redhat.com> wro=
te:
> On 15/01/2020 08:49, Andreas Gruenbacher wrote:
> > There's no point in sharing the internal structure of lock value blocks
> > with user space.
>
> The reason that is in ondisk is that changing that structure is
> something that needs to follow the same rules as changing the on disk
> structures. So it is there as a reminder of that,

I can see a point in that. The reason I've posted this is because Bob
was complaining that changes to include/uapi/linux/gfs2_ondisk.h break
his out-of-tree module build process. (One of the patches I'm working
on adds an inode LVB.) The same would be true of on-disk format
changes as well of course, and those definitely need to be shared with
user space. I'm not usually building gfs2 out of tree, so I'm
indifferent to this change.

Thanks,
Andreas


