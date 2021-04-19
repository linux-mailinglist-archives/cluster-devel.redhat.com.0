Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id AD3C0364A99
	for <lists+cluster-devel@lfdr.de>; Mon, 19 Apr 2021 21:32:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618860777;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xGqNraGDY+apgbPI6thJkMykXjieIkJGhW5ePzlmzWk=;
	b=beNOBrh1E7/Gv/PyhwhaTv86uJk/p79WFbP0QwMiWV4qNhRc0IylSBYzH3lsu07EaLR6Rl
	YnqiVHAG+iBfjGj2/nyWK7uA8km1X8McifWErBy7B0KZxccy/wDb/idqjL3ej68ofxAVT7
	uIIOnSO9oiC0ZlK0ooE66OR08SfZuZE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-R9rUVAAxPQ6kAlPFKQJFxA-1; Mon, 19 Apr 2021 15:32:07 -0400
X-MC-Unique: R9rUVAAxPQ6kAlPFKQJFxA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95A3A88127C;
	Mon, 19 Apr 2021 19:31:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5491760843;
	Mon, 19 Apr 2021 19:31:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F003444A57;
	Mon, 19 Apr 2021 19:31:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13JJVhS4002755 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 19 Apr 2021 15:31:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 824BB1005B8D; Mon, 19 Apr 2021 19:31:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E418110DBAD
	for <cluster-devel@redhat.com>; Mon, 19 Apr 2021 19:31:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7892A802317
	for <cluster-devel@redhat.com>; Mon, 19 Apr 2021 19:31:40 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
	[209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-43-lR0hg86IOZ-ycg-3NScfWg-1; Mon, 19 Apr 2021 15:31:38 -0400
X-MC-Unique: lR0hg86IOZ-ycg-3NScfWg-1
Received: by mail-wr1-f71.google.com with SMTP id
	p10-20020a5d68ca0000b0290102982b78eeso9571792wrw.16
	for <cluster-devel@redhat.com>; Mon, 19 Apr 2021 12:31:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=0WcDwtywqjWxg0VOvgFSmVmH8HAFFuuvuIJrLv/YqKg=;
	b=JltUyvbmO/oHhR6ZCpaKRtPyuShD5+4kCNd7Qn4NpgdNTt1mMsw/EdEIhAFrT4j0EE
	DKMqrdhB1j9ilI3f6fatmlk97IsSx3lZsw1gMgiyy4j1LMKsatRGm9pL6InPt8qGZRJl
	SU1lYfEPBcT+T5L7n/3F3fnHzhhQlLMOMtKa72bHYLqOocyygLGpY9H1SGft1D3j66Fu
	yHKUK+LHbvGyrxXlmvDEQ1B6wfQ6Tq8V3dJhs3EAZH9i/1V6uf0HkYVTIzbBeUuPAJd6
	31xDJA6DMRnslpSGkeex+oSpWnJubbfgfwu/j8tfvHMLUjVZOs1U8N69EtzF6JTHX3c7
	sdfg==
X-Gm-Message-State: AOAM530gUXRmsjGTxj6tSxUh+ysiAizCBbZnpDeh2Fwx1+C8rgPlV5wl
	Mzq+e6sIBcyugXDUwWYnknq4ruAglUnHPcx4SECq9DALrLsL/YtTtlcg8Hex2rF0ENj69ALUdVC
	lx3WgGCtFTb8sYi9CRfqxmNvZijAlzzJHojGkzA==
X-Received: by 2002:a5d:69ca:: with SMTP id s10mr16016432wrw.78.1618860697332; 
	Mon, 19 Apr 2021 12:31:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwlZoanlG51pH2YZQWK6vRuTRLdD0HgRXhjcdm5f0Qd65UOJ9DOjTbD+F0XTeoiTGXxV0VxttgXnabIgTB8Vc=
X-Received: by 2002:a5d:69ca:: with SMTP id s10mr16016422wrw.78.1618860697215; 
	Mon, 19 Apr 2021 12:31:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210419191117.297653-1-anprice@redhat.com>
In-Reply-To: <20210419191117.297653-1-anprice@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 19 Apr 2021 21:31:26 +0200
Message-ID: <CAHc6FU73q2FPW3DNhLhdN=kk09+xAGykFYLeNGtYK3rwbBp5rQ@mail.gmail.com>
To: Andrew Price <anprice@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 13JJVhS4002755
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [PATCH v2 0/8] gfs2-utils: Import
	linux/gfs2_ondisk.h
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
Content-Transfer-Encoding: 8bit

Hi Andy,

On Mon, Apr 19, 2021 at 9:11 PM Andrew Price <anprice@redhat.com> wrote:
> v1: https://listman.redhat.com/archives/cluster-devel/2019-April/msg00021.html
>
> My previous attempt at this did a search+replace to satisfy the field types in gfs2_ondisk.h, which was a little OTT. This attempt adds a linux/types.h that gfs2_ondisk.h will pick up instead of the kernel one.
>
> Having our own gfs2_ondisk.h means that we can support new gfs2 features unconditionally and more easily experiment with on-disk changes; we can use the PRI* macros from inttypes.h for consistent string formatting (appease -Wformat) across architectures, and it gets us closer to being able to compile gfs2-utils on non-linux systems.

this is looking good, thanks.

Andreas


