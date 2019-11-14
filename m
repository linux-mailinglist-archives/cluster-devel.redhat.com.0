Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3FE0EFCDF5
	for <lists+cluster-devel@lfdr.de>; Thu, 14 Nov 2019 19:42:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573756920;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9mPkl4tcGZWXSyMwMo3ChmrStXeHUqVVKB8zvUMfh0M=;
	b=aHUY3lv2to2s6ihtzZU2fS4E8Ayi8c7tZ7CR7McgmozvU76ja5Hsjlsktj+RLTwJfL0Clf
	HfcMQwENobIUwtYNDSASDv0TEomuO1yydCDF8bQmFbDyJUCfYtZzgL3scXkYnfKAZdDNdk
	SqIuzMgDjVP9oQKjjX4Ymc8+Phiz29I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-FJLpWNSsOVqqdwSz9keong-1; Thu, 14 Nov 2019 13:41:58 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41708107ACC6;
	Thu, 14 Nov 2019 18:41:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 94CAD5D6AE;
	Thu, 14 Nov 2019 18:41:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3FD384BB5C;
	Thu, 14 Nov 2019 18:41:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAEIfox3007097 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 14 Nov 2019 13:41:50 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E943B10F1CD4; Thu, 14 Nov 2019 18:41:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E590810F1CCA
	for <cluster-devel@redhat.com>; Thu, 14 Nov 2019 18:41:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A06D185A7A1
	for <cluster-devel@redhat.com>; Thu, 14 Nov 2019 18:41:48 +0000 (UTC)
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
	[209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-28-Oa5lMIPpPNq5UcQS7NgmTg-1; Thu, 14 Nov 2019 13:41:46 -0500
Received: by mail-ot1-f72.google.com with SMTP id v51so3827677otb.5
	for <cluster-devel@redhat.com>; Thu, 14 Nov 2019 10:41:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9vhDXCqcGzCONnduLXvGdx8NF13kRVxlfn39onz6/8o=;
	b=Qy7I1c7gDom5AT0ddpbuGBM7B2Cmyf0U2w3gUqLPdwCiNy0DNxytRZLCdbqiClXNgm
	mqzSwyQrUnKuQcZDeSPPCv2tDWG+9JrzVt4BpwF5c8Vq5wdHJMn9Cw5ZEVLy2tJH5je0
	bVvxp7EcfS7/W56CgZXsoPJm5It6FPq/0i6iGjtV4SYq7Mcguj5DCrTXgry44Ooyl+f6
	/xaRY2cs41erJge02e/9s+ymKYCSKGg3fYLSDsl2zvVBcADiGPL1uWFncR96c7oAfKxj
	DcCqJ3qhRDSHHsXEOPkl7ZryqbuM6WOD5t3eMtVx/6wDeBdzKqfEHPXh1HFzwshi2vSS
	qO7A==
X-Gm-Message-State: APjAAAXjgr2WiT8NWX6g6XzEIEfEd6mi1IuWRYPDpdBB80T2J6sFxM0a
	qiJ3z3AE5rdBMADtyOJWbTKp87INyrabW9l5IeKldXr4bjVdLxbthhkmISTDNb1nf6HGgd5XyRm
	ETQN9YRi4WaI4Rbe6C4kjdoZz6yoF/w2rBdmCNg==
X-Received: by 2002:a05:6830:4ae:: with SMTP id
	l14mr8818733otd.185.1573756905651; 
	Thu, 14 Nov 2019 10:41:45 -0800 (PST)
X-Google-Smtp-Source: APXvYqwHJpQNd7RS71VjuiraI3gMOVOdGIyR8h8J49G6dXT4ADXsnpsuaqdsvTZ3pgVXLGLgmMx5VFKEiWSCoGHzkP8=
X-Received: by 2002:a05:6830:4ae:: with SMTP id
	l14mr8818722otd.185.1573756905438; 
	Thu, 14 Nov 2019 10:41:45 -0800 (PST)
MIME-Version: 1.0
References: <946265143.29711102.1573742986193.JavaMail.zimbra@redhat.com>
	<788089991.29722188.1573743135983.JavaMail.zimbra@redhat.com>
In-Reply-To: <788089991.29722188.1573743135983.JavaMail.zimbra@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 14 Nov 2019 19:41:33 +0100
Message-ID: <CAHc6FU7-2qUokPXwRGBZPTRrv2xRkE47d8KYXGmUCkN3wVnyNw@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-MC-Unique: Oa5lMIPpPNq5UcQS7NgmTg-1
X-MC-Unique: FJLpWNSsOVqqdwSz9keong-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAEIfox3007097
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH] gfs2: Introduce function
	gfs2_withdrawn
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 14, 2019 at 3:52 PM Bob Peterson <rpeterso@redhat.com> wrote:
> This patch adds function gfs2_withdrawn and replaces all checks
> for the SDF_WITHDRAWN bit to call it. This does not change the
> logic or function of gfs2, and it facilitates later improvements
> to the withdraw sequence.

This looks mostly okay, but:

> +/**
> + * gfs2_withdrawn - test whether the file system is withdrawing or withd=
rawn
> + * @sdp: the superblock
> + */
> +static inline bool gfs2_withdrawn(struct gfs2_sbd *sdp)
> +{
> +       if (test_bit(SDF_WITHDRAWN, &sdp->sd_flags))
> +               return true;
> +       return false;

      return test_bit(SDF_WITHDRAWN, &sdp->sd_flags)

> +}

Thanks,
Andreas


