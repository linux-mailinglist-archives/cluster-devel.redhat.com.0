Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF9D6EC9A6
	for <lists+cluster-devel@lfdr.de>; Mon, 24 Apr 2023 12:01:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682330475;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=OQ+mDB7nZoq5bI1Z0+OHKjxa9KfDfzyH5beIM9orIzo=;
	b=Mf6AgWpuFEAO4mZcEfnY0/dOaVErJS6GbcNLiRwbWXWTrl0ZvmvKlo2J/IpW4Hhq254jBw
	GBfMzRsbw8P86ULu0WTcH37Q9khILOxevOuvZKX5vaazPbusdEqkUTZdmexKLhTagA3jWc
	8YCZucodgD1so+zHo9INTs5wALl9nvE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-177-ump_a1U7OPmxMKHcvh_WjQ-1; Mon, 24 Apr 2023 06:01:04 -0400
X-MC-Unique: ump_a1U7OPmxMKHcvh_WjQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD778101A555;
	Mon, 24 Apr 2023 10:01:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6EB9F44007;
	Mon, 24 Apr 2023 10:01:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 205021946594;
	Mon, 24 Apr 2023 10:01:03 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 765071946588 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 24 Apr 2023 10:01:02 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5FEB4C15BA0; Mon, 24 Apr 2023 10:01:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5839DC15BAD
 for <cluster-devel@redhat.com>; Mon, 24 Apr 2023 10:01:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 38FAA8996E2
 for <cluster-devel@redhat.com>; Mon, 24 Apr 2023 10:01:02 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-10-5YKfwUXbPD-6sTvuKEC7PA-1; Mon, 24 Apr 2023 06:01:00 -0400
X-MC-Unique: 5YKfwUXbPD-6sTvuKEC7PA-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-2f8c2258b48so1303222f8f.1
 for <cluster-devel@redhat.com>; Mon, 24 Apr 2023 03:01:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682330459; x=1684922459;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OQ+mDB7nZoq5bI1Z0+OHKjxa9KfDfzyH5beIM9orIzo=;
 b=RILuIOtWS2DMV4vKGKuLWufJWzWbmdtaUV+9g6lAskVxIsyzB7QsX0IBOC0/prINI4
 ywBVARQYPJlfqvDNZz2MrYxXYr8pf7JAO6tXA+W7fqCOptLH7sFsNlnPguLGx1zfbkKX
 abuJKdYiqXgNycrm2pW9vQLKD8ojo/kwqjCh+R7v2EN1ojTOQAlC5vbimNGnIq4Yqkb2
 0mT6XJXPdhBFAs/osfuQFz3E2k86878r7615HnvWXijoNh5w2GCPGz3FNUQSJo992yON
 jnZ6Dt2OcQJlGf3ooqTeshIAiCQfkeqI30RYCZVB4P1hsm4YboZYuZ7D7zJrutdD+u/g
 dteQ==
X-Gm-Message-State: AAQBX9dYp8andQgPKGgXDnos3dFqeoCv5+wPzNrm17Gl5d1WSqi8weCK
 l8qe7yTPU0uj0uyqszBUxeK8EHXsUu9pnU4EDwbDiW3NwNbvWkZ3BtcW1dNS5Dt3zh9godGmxYb
 W6X343gJoXeMTDIkECda8l8ttd6AXFg==
X-Received: by 2002:adf:e54c:0:b0:2fb:ca40:e42c with SMTP id
 z12-20020adfe54c000000b002fbca40e42cmr9171971wrm.6.1682330459437; 
 Mon, 24 Apr 2023 03:00:59 -0700 (PDT)
X-Google-Smtp-Source: AKy350aYjhXQ1ZK35EOZO5trGEKfsBzfzCrfg0h8znLGc+oWS4TVmL2k59ICr+OkXr2hyp6565Pwvg==
X-Received: by 2002:adf:e54c:0:b0:2fb:ca40:e42c with SMTP id
 z12-20020adfe54c000000b002fbca40e42cmr9171952wrm.6.1682330459055; 
 Mon, 24 Apr 2023 03:00:59 -0700 (PDT)
Received: from
 0.7.3.c.2.b.0.0.0.3.7.8.9.5.0.2.0.0.0.0.a.d.f.f.0.b.8.0.1.0.0.2.ip6.arpa
 (0.7.3.c.2.b.0.0.0.3.7.8.9.5.0.2.0.0.0.0.a.d.f.f.0.b.8.0.1.0.0.2.ip6.arpa.
 [2001:8b0:ffda:0:2059:8730:b2:c370])
 by smtp.gmail.com with ESMTPSA id
 h3-20020a5d5043000000b002c70ce264bfsm10383857wrt.76.2023.04.24.03.00.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 03:00:58 -0700 (PDT)
Message-ID: <9c75b6abc800aca8d8dae344460fde6a8080c53b.camel@redhat.com>
From: Steven Whitehouse <swhiteho@redhat.com>
To: Wang Yugui <wangyugui@e16-tech.com>, cluster-devel@redhat.com
Date: Mon, 24 Apr 2023 11:00:58 +0100
In-Reply-To: <20230422092052.F9C8.409509F4@e16-tech.com>
References: <20230422092052.F9C8.409509F4@e16-tech.com>
Organization: Red Hat UK Ltd
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [Cluster-devel] question about gfs2 multiple device support
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, 2023-04-22 at 09:20 +0800, Wang Yugui wrote:
> Hi,
>=20
> Is there some work for gfs2 multiple device support?
>=20
Do you mean multiple devices generically, or specifically the md
driver?

> if multiple device support,
> 1, No need of RAID 0/1/5/6 support.
> =C2=A0=C2=A0 nvme SSD is fast enough for single thread write.
I'm not sure I understand this. Multiple device support generally means
at least one of the RAID modes.

>=20
> 2, can we limit one journal into one device?
The filesystem always assumes a single device with one or more
journals. If multiple devices are used, that is done at the block
layer, which is below the filesystem layer.

>=20
> 3, can we just write lock one device, so better write throughput?
Do you have a specific application in mind? Or certain performance
levels that you need to hit? The write performance will depend a lot on
the I/O pattern, and the underlying device performance. We'll need a
bit more detail to be more specific I'm afraid,

Steve.

>=20
> Best Regards
> Wang Yugui (wangyugui@e16-tech.com)
> 2023/04/22
>=20
>=20

