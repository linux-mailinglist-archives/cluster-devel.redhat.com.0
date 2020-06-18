Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 318CB1FF908
	for <lists+cluster-devel@lfdr.de>; Thu, 18 Jun 2020 18:17:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592497067;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=eg+rGUFDcJrdFsWeJOFLBa2t8v2NBAjjkB0X2zPsioo=;
	b=Yn/ocpvBwCTEWjY1vvpp1IYT0VhYkNcRUK19BZRKRAGBiA/qwxwZnOP5k/K79L18NrycrY
	f1l7Ugi/28kEyCFDRWanXGSJtekg9LDz/V1zKnW/rbewanN3WGrbhN0gFjZhcES/RoX5+J
	3vJAQzaCgD3MVs+isEX0X5/KuscSmDo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-wu8QnPQmMUyaXaB0YT1sWw-1; Thu, 18 Jun 2020 12:17:45 -0400
X-MC-Unique: wu8QnPQmMUyaXaB0YT1sWw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD389A0BD7;
	Thu, 18 Jun 2020 16:17:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C24A5D9D3;
	Thu, 18 Jun 2020 16:17:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DEB4C833C6;
	Thu, 18 Jun 2020 16:17:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05IGHYEf028284 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 18 Jun 2020 12:17:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7D0B9F7FCD; Thu, 18 Jun 2020 16:17:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 78FDEF7FCE
	for <cluster-devel@redhat.com>; Thu, 18 Jun 2020 16:17:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5830D858F02
	for <cluster-devel@redhat.com>; Thu, 18 Jun 2020 16:17:32 +0000 (UTC)
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
	[209.85.161.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-96-K0tBIVVcPTeiRN0_1j5bNQ-1; Thu, 18 Jun 2020 12:17:30 -0400
X-MC-Unique: K0tBIVVcPTeiRN0_1j5bNQ-1
Received: by mail-oo1-f70.google.com with SMTP id k27so2981369ook.9
	for <cluster-devel@redhat.com>; Thu, 18 Jun 2020 09:17:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eg+rGUFDcJrdFsWeJOFLBa2t8v2NBAjjkB0X2zPsioo=;
	b=BA678K7ex/BcfPW5zpMivvfBR1Cnb58epiYhN+Lqmb9cyofXZuHiS4LaaG9rj0kLRG
	VO9fePg6zUH6zs8ZTGyWEj9dqhvbZzEgaHPmjWVrZ4PX/rRn+1eQbP9VT6kkMI8EFT4t
	saGG64mg0gDR70hCj82Ve1G3HXI9NNlVAuy5ta/xHigrFlb8gMDIx8NffCnbJphdFvQc
	Mi8wFSzjSgX1cFhgcySUJjNXEwTOq2UshDZ29A5D/bYM4avQKE4zBXhaJd3IpT4+UqTj
	34iFvRXW4/74PpjJQv1elm2nN9J99n91dhcMtYk/mDoqS8r8TH9555hG7CsVuX6e80IN
	MG1w==
X-Gm-Message-State: AOAM531hY5zF6OM+12KJene2JjV/emPy7gNTP3oEcfIObw7yqT9lLff1
	X0/8wox3mscYYY3SSvm7qE9OzxfedFKNG5fGMTM7K0JMaZ10LRWpWVU46ybPhFRSE4rLrcccMm5
	dFXZySvbWqium0SJG5pmpVinxIbnOGW6oGhWz7g==
X-Received: by 2002:aca:5049:: with SMTP id e70mr3764978oib.72.1592497049778; 
	Thu, 18 Jun 2020 09:17:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyn9Su2gokvBQWRD0meY3QZkPEhtLYY51Iz0wYyy+1HwxbGycwJzCcoziuMvT631eJL34h4xJ4DzXTQziJMbc8=
X-Received: by 2002:aca:5049:: with SMTP id e70mr3764956oib.72.1592497049598; 
	Thu, 18 Jun 2020 09:17:29 -0700 (PDT)
MIME-Version: 1.0
References: <850442235.34134581.1592327923140.JavaMail.zimbra@redhat.com>
	<1194682176.34134614.1592327973401.JavaMail.zimbra@redhat.com>
In-Reply-To: <1194682176.34134614.1592327973401.JavaMail.zimbra@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 18 Jun 2020 18:17:18 +0200
Message-ID: <CAHc6FU7aFDYXGp9Ng5c9XT7j6WUAtGWVTaN9EnYaiguiZ+9uFA@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH] gfs2: simplify code with nq_init
	functions
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi Bob,

On Tue, Jun 16, 2020 at 7:19 PM Bob Peterson <rpeterso@redhat.com> wrote:
> This patch simply cleans up some code to make it more readable by
> using helper functions gfs2_glock_nq_init and dq_uninit instead of
> doing things manually.

the more complicated call sequence [gfs2_holder_init ... gfs2_glock_nq
... gfs2_glock_dq ... gfs2_holder_uninit] produces better code than
just [gfs2_glock_nq_init ... gfs2_glock_dq_uninit]. I wonder if
there's a way to implement those primitives so that the compiler will
automatically produce the better code?

Andreas

