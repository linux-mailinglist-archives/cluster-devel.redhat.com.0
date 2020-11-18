Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3F20C2B8108
	for <lists+cluster-devel@lfdr.de>; Wed, 18 Nov 2020 16:45:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605714322;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=atIugHxeu++mO9Pqy3fRQU2Qm4jvy8mZ8bzvIZxnBOA=;
	b=h7j1WmXI9T12iCYmnynECPlm+Du2vvrIditYGwxvvbwGR6IG49vPUJu1rsbkwSlWkOYF/z
	UVJak9owwPjCPJoa+JDCvI0D44GSVO8QEdQdcpGS/TpyKTP/RjqtujFD2jV334owgYZMTf
	Z/RTauh1B6KNF00boC5Rk8aojEJr2Ac=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-vg2Icy-nM7-yVizwo5Zx5w-1; Wed, 18 Nov 2020 10:45:19 -0500
X-MC-Unique: vg2Icy-nM7-yVizwo5Zx5w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B91F186E8EF;
	Wed, 18 Nov 2020 15:45:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 79E8C5D6A1;
	Wed, 18 Nov 2020 15:45:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8724818095C9;
	Wed, 18 Nov 2020 15:45:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AIFjDx6023109 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 18 Nov 2020 10:45:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5AB002157F26; Wed, 18 Nov 2020 15:45:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 55EBD2166BDB
	for <cluster-devel@redhat.com>; Wed, 18 Nov 2020 15:45:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9C8B2811E91
	for <cluster-devel@redhat.com>; Wed, 18 Nov 2020 15:45:09 +0000 (UTC)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
	[209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-40-I-ydW1QlOlq-AW2K3LgjbQ-1; Wed, 18 Nov 2020 10:45:07 -0500
X-MC-Unique: I-ydW1QlOlq-AW2K3LgjbQ-1
Received: by mail-wm1-f69.google.com with SMTP id a134so986302wmd.8
	for <cluster-devel@redhat.com>; Wed, 18 Nov 2020 07:45:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=atIugHxeu++mO9Pqy3fRQU2Qm4jvy8mZ8bzvIZxnBOA=;
	b=AlpQzK6xl4oS4cVTta2xE4QALb3h8x3Za8O7BdO+6F1WRHOA2r03QUZc51IohHBb8o
	alcBflxxWJ+osejF4FGVqflysT0x8AfpRTUgX51jlbiHPvIK21efM0JlXsnnj32qCoUE
	teSBzgqBauD4Cier8sGResdphuhyBbuQ9EO2/HacNwWd3NYR7fDRu1TRNuhTSE8qfHaw
	GfkyIqRApzaE7jtgr/evkCdk7x/M1MjLjD66KIIZ8O5a6ppQd33/MP8onYkxaIzBRUWP
	231gOMwO3NmGIg9MgichNU7Y/BhOHjEHcqBibKnY40BhBLdCe6avpCU76VnWrXGSqV1E
	HPhg==
X-Gm-Message-State: AOAM532F06j9cSJ4mgdfrm3ktZ2Q0isMO/HyXCCx2aEfnjUiFq3bZqI9
	IIDaiCrhOIL/oREXKiG+iQCnJSS8XYCIVN1Tj485beDpj+TehQf7A6vTCVJ6GVlje0AWTZKMkN/
	LzYjtHE8nzrPoAvj3Ce1+ZqP8kCb0h3KNhz4T8w==
X-Received: by 2002:a5d:4591:: with SMTP id p17mr5411999wrq.361.1605714305990; 
	Wed, 18 Nov 2020 07:45:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwKWOf8AxjGQLAcaJ6TuW8uAH70tHY0ET4qsojBAoUTVTqZ4A5gWfm8VvBTSVBQN002/Pk9nqbLXqA9xQlnkx8=
X-Received: by 2002:a5d:4591:: with SMTP id p17mr5411986wrq.361.1605714305852; 
	Wed, 18 Nov 2020 07:45:05 -0800 (PST)
MIME-Version: 1.0
References: <20201118153120.896318-1-anprice@redhat.com>
In-Reply-To: <20201118153120.896318-1-anprice@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 18 Nov 2020 16:44:54 +0100
Message-ID: <CAHc6FU4fJdM8=e=5Rco=xOHtG4vjyfbWKP=9nEtEyHQzpUUhGw@mail.gmail.com>
To: Andrew Price <anprice@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH] MAINTAINERS: Add gfs2 bug tracker
	link
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 18, 2020 at 4:31 PM Andrew Price <anprice@redhat.com> wrote:
> And remove the obsolete website URL.

Okay, pushed to for-next.

Thanks,
Andreas

