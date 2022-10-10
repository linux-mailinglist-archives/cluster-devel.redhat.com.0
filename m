Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 443475FA7B4
	for <lists+cluster-devel@lfdr.de>; Tue, 11 Oct 2022 00:35:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665441338;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=oCUzlbX4lI+qBxINl7LzHl5RgJSkmrssEexCv70Q4K4=;
	b=BFmlKnU1mu71qncHf2GBdALsHRCt0PF7vvKiglGKsVM7lMXjhB1bsHAnHXL7mY/ImXbcHK
	kYtap4akMp2FzjHp6pllQHLXHURq03VaqUvvRAjX97Lt9BZFwc1D8/iblUk0lTVDKd+q5r
	CUj6hSOz+0oszbMELYnS/0Y6z8UhSLw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-111-skhGv4e8P7m1dH8gAkdoxg-1; Mon, 10 Oct 2022 18:35:33 -0400
X-MC-Unique: skhGv4e8P7m1dH8gAkdoxg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C59E8185A792;
	Mon, 10 Oct 2022 22:35:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6AC4E4022D5;
	Mon, 10 Oct 2022 22:35:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0402F1946A45;
	Mon, 10 Oct 2022 22:35:31 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id AD35119465A0 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 10 Oct 2022 22:35:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5EE2F49BB62; Mon, 10 Oct 2022 22:35:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 57AE249BB60
 for <cluster-devel@redhat.com>; Mon, 10 Oct 2022 22:35:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3CAD1811726
 for <cluster-devel@redhat.com>; Mon, 10 Oct 2022 22:35:29 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-158-YL-c478CO4eUUuYxpVHprg-1; Mon, 10 Oct 2022 18:35:27 -0400
X-MC-Unique: YL-c478CO4eUUuYxpVHprg-1
Received: by mail-pg1-f179.google.com with SMTP id 128so3606627pga.1
 for <cluster-devel@redhat.com>; Mon, 10 Oct 2022 15:35:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oCUzlbX4lI+qBxINl7LzHl5RgJSkmrssEexCv70Q4K4=;
 b=fP6lhRnsZws0NBQsuzNdWsLtSyjlCRyWUV5bdoeNJlkbT+YqUlE28UYWmeUXZRqpBa
 Csa2Qwaib6233SkAmg58nXy36VPALxBA8+5yTuLu/84DEERYlcwB0DJQmViAHau1t9um
 ARJgFIxpssqFqdKPQKFS6S8DQrh2QFBknUYVCPnd7oCu6jrkl4gbROLWkl0puQDkj/C3
 gQlFEwte5hi5iUxvbnpvL4gAPzMQN7sETPmOaFSMRT5gqG1OrRjYVWqaEHqoHDuXkMwc
 TSf8/HvUJ0rl6+QZqZwYeSeEoTzNnO0id97KMmMZo3w16Q8LMB9tHmG2ag+vZvjb1qCl
 hgsQ==
X-Gm-Message-State: ACrzQf3yD+eCigk2Vt60MhNDzqZcpfeVoKTpZEJC3ddD+vq4tTRMekSz
 1yZQG9vP3mhb8wnfCwfOlaAb9Q==
X-Google-Smtp-Source: AMsMyM60Ou9Efab64ujpBY0XfNTnxeOS7Gm7nER2LiLQbw09k18Z7G7kUFmUOCkRUr6Sh+imlj6BhQ==
X-Received: by 2002:a63:1d1:0:b0:43a:348b:63fd with SMTP id
 200-20020a6301d1000000b0043a348b63fdmr19192959pgb.52.1665441325926; 
 Mon, 10 Oct 2022 15:35:25 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 65-20020a630244000000b0045913a96837sm6707422pgc.24.2022.10.10.15.35.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 15:35:24 -0700 (PDT)
Date: Mon, 10 Oct 2022 15:35:24 -0700
From: Kees Cook <keescook@chromium.org>
To: David Teigland <teigland@redhat.com>
Message-ID: <202210101534.BA51029@keescook>
References: <Y0IFEUjwXGZFf7bB@mail.google.com>
 <378C6BDE-0A68-4938-86CD-495BD5F35BE6@chromium.org>
 <Y0IsXXYnS4DnWkMW@mail.google.com>
 <202210082044.51106145BD@keescook>
 <20221010210039.GA30273@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20221010210039.GA30273@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [Cluster-devel] [PATCH v2][next] dlm: Replace one-element array
 with flexible-array member
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: cluster-devel@redhat.com,
 Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 10, 2022 at 04:00:39PM -0500, David Teigland wrote:
> On Sat, Oct 08, 2022 at 09:03:28PM -0700, Kees Cook wrote:
> > On Sun, Oct 09, 2022 at 03:05:17PM +1300, Paulo Miguel Almeida wrote:
> > > On Sat, Oct 08, 2022 at 05:18:35PM -0700, Kees Cook wrote:
> > > > This is allocating 1 more byte than before, since the struct size didn't change. But this has always allocated too much space, due to the struct padding. For a "no binary changes" patch, the above "+ 1" needs to be left off.
> > > 
> > > That's true. I agree that leaving "+ 1" would work and produce a
> > > no-binary-changes patch due to the existing padding that the structure
> > > has. OTOH, I thought that relying on that space could bite us in the
> > > future if anyone tweaks the struct again...so my reaction was to ensure 
> > > that the NUL-terminator space was always guaranteed to be there.
> > > Hence, the change on c693 (objdump above).
> > > 
> > > What do you think? Should we keep or leave the above
> > > "+ 1" after the rationale above?
> > 
> > I think it depends on what's expected from this allocation. Christine or
> > David, can you speak to this?
> 
> Hi, thanks for picking through that.  Most likely the intention was to
> allow up to 64 (DLM_LOCKSPACE_LEN) character names, and then use the
> ls_name[1] for the terminating byte.  I'd be happy to take the patch

Should this just use:

	char			ls_name[DLM_LOCKSPACE_LEN + 1];

instead, or is the byte savings worth keeping it dynamically sized?

-- 
Kees Cook

