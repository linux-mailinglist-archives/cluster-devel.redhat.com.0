Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8F65FBAAA
	for <lists+cluster-devel@lfdr.de>; Tue, 11 Oct 2022 20:44:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665513895;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=So4abhNWYFcv274xdP8VWRO69sa0lbWIaXDw4c76tcc=;
	b=HuLvWQVifLSOdv+P3LCEurkoo4RRn2D0j+pJdwCn7aGIv/bxryhX4J7SBdq4EA0W75pU6w
	hOF0VbACNwX7Uw4d9l0WnywcLZA1BUsGFQj7TzfTD95kGNLpEtpeRrsfoH3aCTDXGZvhiE
	700q0sLgoka977Fwzd77voWCMJNUoMw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-147-WnNHnkjBMyaribAhW858bw-1; Tue, 11 Oct 2022 14:44:49 -0400
X-MC-Unique: WnNHnkjBMyaribAhW858bw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 81AD53C0F223;
	Tue, 11 Oct 2022 18:44:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 006FD492B05;
	Tue, 11 Oct 2022 18:44:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9F44B19465A2;
	Tue, 11 Oct 2022 18:44:46 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0756A194658F for <cluster-devel@listman.corp.redhat.com>;
 Tue, 11 Oct 2022 18:44:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DC3DF112D408; Tue, 11 Oct 2022 18:44:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D5485112D402
 for <cluster-devel@redhat.com>; Tue, 11 Oct 2022 18:44:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B1671800186
 for <cluster-devel@redhat.com>; Tue, 11 Oct 2022 18:44:44 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-425-qRfZsuEaN4uk6EPQeGVUIA-1; Tue, 11 Oct 2022 14:44:41 -0400
X-MC-Unique: qRfZsuEaN4uk6EPQeGVUIA-1
Received: by mail-pf1-f174.google.com with SMTP id 67so14308985pfz.12;
 Tue, 11 Oct 2022 11:44:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=So4abhNWYFcv274xdP8VWRO69sa0lbWIaXDw4c76tcc=;
 b=2gHEP8ihdreS5u74VdjRGF0Sq6fOluPzrKjfv5tKRRdqd1ucICyLuB3QilLpLH238D
 5P0bv6pbYjISmOLdzHT6rDryjiYOBnQrFV2tcSmnt17xT6HSDK2LVngxEDMcj2gf7ppo
 mYj+hjeBYZwAmbuqFI7tdEb9f20GCE/N9PyZIlelgguTmfDrQK0jhqQbeJ7MyVPyH1yW
 k4Qhzc7YResfl+V/4nfQ/LhOLVpci9z24ulxScstO1422ATUG3obpVJgyRJ9CmHvjDiP
 afW0d4+cJ808rhKm0+ytB8pYvJE3hzy3K0I9AuE+PI5/9h++UDNiGrCE5fN1ty5Mnfbc
 OIiA==
X-Gm-Message-State: ACrzQf1teP3v8H84uEeagR4IGHklKl8zOgZyGifk0s8r9nneVML9uq06
 FXYzE63JZp0LqhVjf784gX3fiQQki3nDqA==
X-Google-Smtp-Source: AMsMyM7BJ8CB9EKNxnOSbRKrT7LpY6uE4q/wqvNSLI9/+llW7wxWlnmGpp25dt/3hYuvgPu5aaBIBQ==
X-Received: by 2002:a63:4753:0:b0:462:b3f0:a984 with SMTP id
 w19-20020a634753000000b00462b3f0a984mr9116030pgk.501.1665513879789; 
 Tue, 11 Oct 2022 11:44:39 -0700 (PDT)
Received: from mail.google.com (122-58-209-93-fibre.sparkbb.co.nz.
 [122.58.209.93]) by smtp.gmail.com with ESMTPSA id
 t4-20020a17090abc4400b0020d352dc81fsm4565078pjv.54.2022.10.11.11.44.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 11:44:38 -0700 (PDT)
Date: Wed, 12 Oct 2022 07:44:30 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: David Teigland <teigland@redhat.com>
Message-ID: <Y0W5jkiXUkpNl4ap@mail.google.com>
References: <Y0IFEUjwXGZFf7bB@mail.google.com>
 <378C6BDE-0A68-4938-86CD-495BD5F35BE6@chromium.org>
 <Y0IsXXYnS4DnWkMW@mail.google.com>
 <202210082044.51106145BD@keescook>
 <20221010210039.GA30273@redhat.com> <202210101534.BA51029@keescook>
 <20221011152031.GA11089@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20221011152031.GA11089@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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
Cc: cluster-devel@redhat.com, linux-hardening@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 11, 2022 at 10:20:31AM -0500, David Teigland wrote:
> On Mon, Oct 10, 2022 at 03:35:24PM -0700, Kees Cook wrote:
> > On Mon, Oct 10, 2022 at 04:00:39PM -0500, David Teigland wrote:
> > > On Sat, Oct 08, 2022 at 09:03:28PM -0700, Kees Cook wrote:
> > > > On Sun, Oct 09, 2022 at 03:05:17PM +1300, Paulo Miguel Almeida wrote:
> > > > > On Sat, Oct 08, 2022 at 05:18:35PM -0700, Kees Cook wrote:
> > > > > > This is allocating 1 more byte than before, since the struct size didn't change. But this has always allocated too much space, due to the struct padding. For a "no binary changes" patch, the above "+ 1" needs to be left off.
> > > > > 
> > > > > That's true. I agree that leaving "+ 1" would work and produce a
> > > > > no-binary-changes patch due to the existing padding that the structure
> > > > > has. OTOH, I thought that relying on that space could bite us in the
> > > > > future if anyone tweaks the struct again...so my reaction was to ensure 
> > > > > that the NUL-terminator space was always guaranteed to be there.
> > > > > Hence, the change on c693 (objdump above).
> > > > > 
> > > > > What do you think? Should we keep or leave the above
> > > > > "+ 1" after the rationale above?
> > > > 
> > > > I think it depends on what's expected from this allocation. Christine or
> > > > David, can you speak to this?
> > > 
> > > Hi, thanks for picking through that.  Most likely the intention was to
> > > allow up to 64 (DLM_LOCKSPACE_LEN) character names, and then use the
> > > ls_name[1] for the terminating byte.  I'd be happy to take the patch
> > 
> > Should this just use:
> > 
> > 	char			ls_name[DLM_LOCKSPACE_LEN + 1];
> > 
> > instead, or is the byte savings worth keeping it dynamically sized?
> 
> Yes, I think that's the best option.
> Dave
> 

Thanks for the reply Dave; Thanks for the suggestion Kees;
I'll send a new patch for it :)

Paulo A.

