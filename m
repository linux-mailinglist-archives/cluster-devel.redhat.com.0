Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id B73DE1F03DE
	for <lists+cluster-devel@lfdr.de>; Sat,  6 Jun 2020 02:23:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591403027;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=BQxYJzQBkv5fhCBblUUehlL2KoMzR/BzGBVsfr7Se/o=;
	b=hahQXMkZ6b2zzmn1ULb+5XA51Ei+diaFTXxsuccGkpYbQdYa9KHgm3KEWRp0eue48RYzjQ
	ws0rgOL34EpJbfLLLnq32X+gICazLMzjvrGiTn5j/LCglZXFiL3P8VH+hGY3NSwLFmXYx5
	JsAsjtPdbuwl5mP8CRAbbGDscvUjVYg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-7m04YXXFPU2u7ueA1fjUKw-1; Fri, 05 Jun 2020 20:23:46 -0400
X-MC-Unique: 7m04YXXFPU2u7ueA1fjUKw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA24987307A;
	Sat,  6 Jun 2020 00:23:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BAA5F78F1B;
	Sat,  6 Jun 2020 00:23:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A89FFB34A7;
	Sat,  6 Jun 2020 00:23:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 055Ed7WR008188 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 5 Jun 2020 10:39:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4A0D4422F6; Fri,  5 Jun 2020 14:39:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 45A3F42AA8
	for <cluster-devel@redhat.com>; Fri,  5 Jun 2020 14:38:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E145F8E2DF3
	for <cluster-devel@redhat.com>; Fri,  5 Jun 2020 14:38:57 +0000 (UTC)
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
	[209.85.161.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-72-yx1m4OlmM1KDOg6R933cfw-1; Fri, 05 Jun 2020 10:38:56 -0400
X-MC-Unique: yx1m4OlmM1KDOg6R933cfw-1
Received: by mail-oo1-f70.google.com with SMTP id x29so2447084ooc.3
	for <cluster-devel@redhat.com>; Fri, 05 Jun 2020 07:38:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=BQxYJzQBkv5fhCBblUUehlL2KoMzR/BzGBVsfr7Se/o=;
	b=BR6SHlf9CieeCRts5UYUWSfi56m9jHs7aJm+6WuQWaWaGG1LBiS90nHGurvrOnueNM
	gXPaZP4M1dzgSjJNGNtecpMWV2sJ48q0zplV05ZaDpgEWF8NdnTmlGppOmFhcx+cLa3h
	hfFdYvirlZdhLCAN1JagHN+0Vzla2cEbG7/LDmtUr+Rg+ib72RdFjpQU39nCz4GESa9k
	vj2O4in6ZuS5VP+UTSpCtfd5CePfD6hNtfMXXpkXpwq208rtV1uwrde1e1NmFbdwLvwZ
	QPns/An+bbuItMmSl0HLRaMcYmKw5VpgPe0YFevGDvDlqDbAuxftuIOsICx6q3h20REv
	DaMw==
X-Gm-Message-State: AOAM5331WGzAKDsaqRp8Svr3RABo2zrO34OHGRCcuY8IQONlyG03kY7s
	ag0YtJGSN7fQO5hmFyJ3xWR9WkHnQ89jCv+XebKAheMvs8wHIcxk2Ska9g1nngu5kPJNmcXHju8
	2Cmzqn72Dyh4Tz/RJh1QsKYxb82vElt5Rhb8Sfg==
X-Received: by 2002:aca:f38b:: with SMTP id r133mr2044108oih.10.1591367935110; 
	Fri, 05 Jun 2020 07:38:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUPmOaH60azPTW0Ad8/ppq4EC8Hku/2xjy5ZDZL6qzKPCRz5ZWNSr+CfgzhqhHn2K159AWvuVM16ZL//ONjtM=
X-Received: by 2002:aca:f38b:: with SMTP id r133mr2044100oih.10.1591367934908; 
	Fri, 05 Jun 2020 07:38:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200526130536.295081-1-rpeterso@redhat.com>
In-Reply-To: <20200526130536.295081-1-rpeterso@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Fri, 5 Jun 2020 16:38:43 +0200
Message-ID: <CAHc6FU6mcGB9ZPOfEhn6UTVY6qDL5jxpC5u1b0w5OVr4=jAH0g@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [PATCH 0/8] Misc Patch Collection
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi Bob,

On Tue, May 26, 2020 at 3:07 PM Bob Peterson <rpeterso@redhat.com> wrote:
> Andreas expressed some concerns about some of the others. For example, he
> didn't like that the new "status" sysfs file was taking "try" locks, but
> if the lock is held, I don't know of a better way to do this.

walking a linked list that's protected by a spin lock without holding
that spin lock is so fundamentally broken that I don't see why we even
need to discuss it. There's nothing that guarantees that we'll be able
to walk the list.

The spin_is_locked checks this patch adds for reporting the states of
spin locks are practically useless as well.

> He also expressed
> a concern that the new file should be in debugfs rather than sysfs.
> I'm open to opinions. Regardless of where it is, the new debug file is a
> perfect candidate to include in sos reports.

It may be better to include more relevant information in trace points.
That way, we automatically get that information correlated with other
trace events to see what was happening when.

Thanks,
Andreas

