Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 382ED42C33D
	for <lists+cluster-devel@lfdr.de>; Wed, 13 Oct 2021 16:31:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634135481;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=AO/zChsVkIYLZ96daeF/ZiQLlqScJHcanz8k6BY2Rvc=;
	b=AxnjTnO5IM+1hhUib35ardPbsqE1TAAovTjuC1RXutWxSzHw3J8KAsQBBHr5udIKOlx1cK
	JzFcRcY1Ryi0EQslCtyUReAjz1Si/4Buw7MHGHpbY8d3HKZVXwdM6Jxd/avUx80IsUBhFq
	IUTYkG8bL5FUHvK7fI78j/JfZDlqsYA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-i5OttNhtMsSzeUxy3PlLUQ-1; Wed, 13 Oct 2021 10:31:17 -0400
X-MC-Unique: i5OttNhtMsSzeUxy3PlLUQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4942CC629;
	Wed, 13 Oct 2021 14:31:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 98D8E19729;
	Wed, 13 Oct 2021 14:31:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 21C384EA29;
	Wed, 13 Oct 2021 14:31:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19DEUk0I018284 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 13 Oct 2021 10:30:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8F62040CFD12; Wed, 13 Oct 2021 14:30:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A92F40CFD10
	for <cluster-devel@redhat.com>; Wed, 13 Oct 2021 14:30:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 70FFC800B29
	for <cluster-devel@redhat.com>; Wed, 13 Oct 2021 14:30:46 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
	[209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-544-EiYV5_knOLa39PJKjRtq6g-1; Wed, 13 Oct 2021 10:30:45 -0400
X-MC-Unique: EiYV5_knOLa39PJKjRtq6g-1
Received: by mail-wr1-f71.google.com with SMTP id
	r21-20020adfa155000000b001608162e16dso2114081wrr.15
	for <cluster-devel@redhat.com>; Wed, 13 Oct 2021 07:30:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=AO/zChsVkIYLZ96daeF/ZiQLlqScJHcanz8k6BY2Rvc=;
	b=u48lYXDq/oEmCEBfKks3zVFsEDRcPegUBBLR/biSVS6emIgoFHqty9pmlNAG1coBsX
	aAt/lPgHmYUBIIfp7O0/uoZfWUFYlpGHEAqVcNk2iPlfmD75su/xPy+jY7Hz85Vi7dsR
	IWrZVc2ktbn6hg8MHXchJJsq46xem90ZY2frPFn3gttMtlBaeP3fIBWr5sUAwDp0yKOy
	eSbM6e2Af8XCHFir6oARD4f2MctmnOJPLlJ5h+n0iHbi1vkD6ScHRmxCHD5JARJLbmX4
	uXxWsXtl/3w5EXumSlhAwI596KY4w0Et1+hVLPhGfyBQV3V6u+7UusMQGbME2joe7hrL
	Un+g==
X-Gm-Message-State: AOAM533BFfvtaS+Lie4Y4MFZoKOG2BgDQiKBivwyBr/8fumIDkBrIMLJ
	YTDvjaaiu5fR4fkBmQdDEGTeuoSqV9NM6VyV2xdx35DPG6GURmiaAmcvhUgfkY2rfl4AcS4QpW+
	LzXMeXYILpQ3Fj8M9dlK/eOuyDovvMtaR6H7mDg==
X-Received: by 2002:a1c:191:: with SMTP id 139mr13353248wmb.186.1634135443847; 
	Wed, 13 Oct 2021 07:30:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyqH/rCG9AXDVUiqC1etKy/JfEXaqVkIX9zKnVTbSSiI66uhKSHLO7m4Z2QSTOV7VhlCJ56O4JUFybYJ00jvzA=
X-Received: by 2002:a1c:191:: with SMTP id 139mr13353226wmb.186.1634135443644; 
	Wed, 13 Oct 2021 07:30:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210920190518.23056-1-tim.gardner@canonical.com>
In-Reply-To: <20210920190518.23056-1-tim.gardner@canonical.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 13 Oct 2021 16:30:32 +0200
Message-ID: <CAHc6FU6Zn7L1p0yeQHepk5+T_YQz3dpPa26dxXiAtr=nOoXeFA@mail.gmail.com>
To: Tim Gardner <tim.gardner@canonical.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [Cluster-devel] [PATCH] gfs2: Fix unused value warning in
	do_gfs2_set_flags()
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

Hi Tim,

On Mon, Sep 20, 2021 at 9:12 PM Tim Gardner <tim.gardner@canonical.com> wrote:
> Coverity complains of an unused value:
>
> CID 119623 (#1 of 1): Unused value (UNUSED_VALUE)
> assigned_value: Assigning value -1 to error here, but that stored value is
> overwritten before it can be used.
> 237        error = -EPERM;
>
> Fix it by removing the assignment.

pushed to for-next.

Thanks,
Andreas

