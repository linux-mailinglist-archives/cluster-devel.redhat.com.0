Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 45F2735A7ED
	for <lists+cluster-devel@lfdr.de>; Fri,  9 Apr 2021 22:35:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618000527;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=koMhPMwHT2lbb7QqoyG15e3gGwjcJZXavVfrNMzB8XI=;
	b=PKkrnpEx4R+mXhcZHVsY5ddAFRtijbpxOc3YbG9RbBNY/JcDaYkjdrCW+22YT59kXG+b/x
	bAaO2Mmh2PUc9bPKYyPqePVoc6bFY70XeJEW9DbaVorMUE1ov8anO2Hf6oQSw0gzJMR37h
	oW2MuIvJH+ozYp93dwP802/UBUTAkx4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-FVMsV_XAOIerF4lbQKQ_Mg-1; Fri, 09 Apr 2021 16:35:25 -0400
X-MC-Unique: FVMsV_XAOIerF4lbQKQ_Mg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5BD4C801814;
	Fri,  9 Apr 2021 20:35:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BA295D9E3;
	Fri,  9 Apr 2021 20:35:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AB6001806D0E;
	Fri,  9 Apr 2021 20:35:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 139KZJaD027675 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 9 Apr 2021 16:35:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C527EFDCF7; Fri,  9 Apr 2021 20:35:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BFDB9107107
	for <cluster-devel@redhat.com>; Fri,  9 Apr 2021 20:35:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8F03D85A5A8
	for <cluster-devel@redhat.com>; Fri,  9 Apr 2021 20:35:17 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
	[209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-516-FC7QzfxfNEKhDUJCr_roQg-1; Fri, 09 Apr 2021 16:35:16 -0400
X-MC-Unique: FC7QzfxfNEKhDUJCr_roQg-1
Received: by mail-wr1-f69.google.com with SMTP id a6so2778814wro.15
	for <cluster-devel@redhat.com>; Fri, 09 Apr 2021 13:35:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=koMhPMwHT2lbb7QqoyG15e3gGwjcJZXavVfrNMzB8XI=;
	b=aX/JuZi4oZODG47hEgzhM5Eb84oBbfW6Z82J3RrxNjvd1Zm7oeaS0qKCGGjOVbq2K5
	uNwJWgynAzeVbTErtnYKZSoonlq+PSReHO868k6dmHxQlh7mEeuraEqBRIWoHBbqS8dH
	CSD5AxjaSNTJOelF/a8dYdQbwYzqneRIvjeTTJ5/Tq/1rfll/1JC54vRHU/GoIufvs7h
	LA6KnALxas50KbTHZ6U13UJpncv//+ceQZ+gkshOF6mlTYMrqlGFMKUZaeYANZAmrR3L
	J2O4kKmIyITVrhRqaLABJFMSJeoen/5c/UYforRF5R8b+2LqPBT8jeRfbXFsAPswsZkX
	XCrA==
X-Gm-Message-State: AOAM532Vi/PbBQgAgNuCs0sVvD9dcwv0BNd73kh/X3speuDRILWhsHNq
	h0BKTOHkpl7cL3REDuOEOt3fcZfqm9nFW1wXp0BH1iOaPoF0D6KU6VU621hCuIvNZduC1OyA8lG
	MRg2NX6s1uXe6t7KZidmhIbGhwcpwVV2nTzM6XA==
X-Received: by 2002:a1c:a985:: with SMTP id
	s127mr15404381wme.164.1618000514073; 
	Fri, 09 Apr 2021 13:35:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsoEtyHgL80LtPo7DmcPOTI+OKxn7AZBWny2gilTwCjCQXS23npaN31Bqpni3+JGbrKuTm9+4Na/fg+TwFdPs=
X-Received: by 2002:a1c:a985:: with SMTP id
	s127mr15404372wme.164.1618000513940; 
	Fri, 09 Apr 2021 13:35:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210326091151.311647-1-lee.jones@linaro.org>
	<20210406091126.GT2916463@dell>
	<468723920.4255981.1617709446972.JavaMail.zimbra@redhat.com>
	<20210406115434.GU2916463@dell>
In-Reply-To: <20210406115434.GU2916463@dell>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Fri, 9 Apr 2021 22:35:02 +0200
Message-ID: <CAHc6FU4bH91pWgFMytuvhgkr9YJs_VdggZdjEC6EwQJ-9Jj+3Q@mail.gmail.com>
To: Lee Jones <lee.jones@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [Cluster-devel] [PATCH 00/18] Rid W=1 warnings from GFS2
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi Lee,

On Tue, Apr 6, 2021 at 1:54 PM Lee Jones <lee.jones@linaro.org> wrote:
> > > These have been on the list for a couple of weeks now.

thanks for your fixes, I've gone through them now. I've fixed up some
comments instead of "demoting" them to make the patch somewhat less
destructive, and I found a few more minor issues along the way. Those
changes are now all in the following commit:

  https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git/commit/?id=c551f66c5dfef

Thanks,
Andreas

