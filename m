Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD4B54C3C8
	for <lists+cluster-devel@lfdr.de>; Wed, 15 Jun 2022 10:43:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655282597;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Pp3V9BqgNtPea31B0W2T8xFju1mh7v2QJpG/R1M4ah0=;
	b=YuI3mHxrZH4xEBgGg/OHep95nFhV/ndwZbOloaGdno+bxdMY2pE3IdU2/ds0W+sZa/t8Wm
	Y7Y0UQG7kKw2vmKrjslKkVkfpTKmxrBhyiuGi/ylPzWASwCQV3DsVxi0UQoS+lK5g4j4nN
	YIyMdma199wAKOQvvId7bgKlNLJ28XM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-481-3Rju7piMOz2uF5cw0zqVPg-1; Wed, 15 Jun 2022 04:43:09 -0400
X-MC-Unique: 3Rju7piMOz2uF5cw0zqVPg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 06A8A85A580;
	Wed, 15 Jun 2022 08:43:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C37D04047768;
	Wed, 15 Jun 2022 08:43:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7ED25194975B;
	Wed, 15 Jun 2022 08:43:08 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 276671947B84 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 15 Jun 2022 08:43:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DE5CF400F3FF; Wed, 15 Jun 2022 08:43:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DA60B404E4C6
 for <cluster-devel@redhat.com>; Wed, 15 Jun 2022 08:43:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C1865185A79C
 for <cluster-devel@redhat.com>; Wed, 15 Jun 2022 08:43:06 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-255-9lJRx1MNP_22wt-Kea9wvg-1; Wed, 15 Jun 2022 04:43:04 -0400
X-MC-Unique: 9lJRx1MNP_22wt-Kea9wvg-1
Received: by mail-wm1-f72.google.com with SMTP id
 h205-20020a1c21d6000000b0039c96ec500fso922199wmh.8
 for <cluster-devel@redhat.com>; Wed, 15 Jun 2022 01:43:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=Pp3V9BqgNtPea31B0W2T8xFju1mh7v2QJpG/R1M4ah0=;
 b=GO6RJE1mhBw+0Pds4OHlcGQmH9SQLJQ0gXy6PBvJJCsI2qk1GJt2kp5Ys27tzYRlCu
 c6B364Xcgq3NyQ5we+f9jvdEH2bw0ae8oDOtcE+xo7Tbi2Q37SpLxVukjE0Kp6bQpYpN
 mF40qMSnXhB+ri4PXioe0D7fAMTCcopbNRZAnDWUi1Vpayh0u2JsMpVSQjbKKHO8Y7D6
 bdC1ttEL9pBDgT4bxGZTPChCoRiFU1JuMfnADcY5O1bN+Szl6iK16fh1XPG/UXuYkjZe
 Y9sXYus2/hHhDDWpF/oYR5HAHPktHyW5lNUEf04DZLT0Gl2bEBY7okmS56wVtQ3Jieho
 sLcA==
X-Gm-Message-State: AJIora+JxvZN/1sKiHBR0WwXHPPDT37N58W+1+20TUbeHzp9iY4AvZfU
 ozEEJk1qfoNh+AkfxdXSOd2eIPgp8/mkLrcPVPCbGEQawTYhs6ITOppRHfi6RSRwMlBhvsaWaiK
 yXYMO0acNGi0taed+PsxxrQ==
X-Received: by 2002:a05:6000:381:b0:219:b933:38 with SMTP id
 u1-20020a056000038100b00219b9330038mr9070832wrf.15.1655282583462; 
 Wed, 15 Jun 2022 01:43:03 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vXrCCF/df0YjDcqPY2VswaghHhAqsdsjf+uDD2y7NYPKn8JB78ggMFziBqNP4BvVPqXY/mkA==
X-Received: by 2002:a05:6000:381:b0:219:b933:38 with SMTP id
 u1-20020a056000038100b00219b9330038mr9070814wrf.15.1655282583213; 
 Wed, 15 Jun 2022 01:43:03 -0700 (PDT)
Received: from
 0.7.3.c.2.b.0.0.0.3.7.8.9.5.0.2.0.0.0.0.a.d.f.f.0.b.8.0.1.0.0.2.ip6.arpa
 (0.7.3.c.2.b.0.0.0.3.7.8.9.5.0.2.0.0.0.0.a.d.f.f.0.b.8.0.1.0.0.2.ip6.arpa.
 [2001:8b0:ffda:0:2059:8730:b2:c370])
 by smtp.gmail.com with ESMTPSA id
 z2-20020a5d4c82000000b0020c5253d8fcsm17009928wrs.72.2022.06.15.01.43.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jun 2022 01:43:02 -0700 (PDT)
Message-ID: <2b7e361101204fbf6b0c2ad783f9dd623f851f34.camel@redhat.com>
From: Steven Whitehouse <swhiteho@redhat.com>
To: =?UTF-8?Q?=ED=99=8D=EC=8B=A0?= shin hong <hongshin@gmail.com>, 
 cluster-devel@redhat.com
Date: Wed, 15 Jun 2022 09:43:01 +0100
In-Reply-To: <AANLkTi=+JtX-68=40B57K7cs9_F47Skhb7PfxJn9Dmor@mail.gmail.com>
References: <AANLkTi=+JtX-68=40B57K7cs9_F47Skhb7PfxJn9Dmor@mail.gmail.com>
Organization: Red Hat UK Ltd
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: Re: [Cluster-devel] BUG? racy access to i_diskflags
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
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi,

On Tue, 2010-08-17 at 13:28 +0900, 홍신 shin hong wrote:
> Hi. I am reporting an issue suspected as racy
> while I read inode_go_lock() at gfs2/glops.c in Linux 2.6.35.
> 
> Since I do not have much background on GFS2, I am not certain
> whether the issue is serious or not. But please examine the issue
> and let me know your opinion.
> 
> It seems that inode_go_lock() accesses gfs2_inode's i_diskflags field
> without any lock held.
> 
> But, as do_gfs2_set_flags() updates gfs2_inode's i_diskflags,
> concurrent executions with with inode_go_lock() might result
> race conditions.
> 
> Could you examine the issue please?
> 
> Sincerely
> Shin Hong

Yes, inode_go_lock() does examine those flags, but the layers above
that call should ensure that it is single threaded in effect. The
setting of flags required a glock is held, and inode_go_lock() would be
called as part of the glock acquisition, and it is single threaded even
if a shared lock is requested, so it will have completed before
do_gfs2_set_flags() is called. Or perhaps I should say, it should have
completed before then unless you have found a code path where that is
not the case?

Steve.


