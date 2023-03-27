Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6C26CA449
	for <lists+cluster-devel@lfdr.de>; Mon, 27 Mar 2023 14:43:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679921031;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qSG7y+Ntsb0V0Se35GjDSzQJ3PXnyxnyggzDwT26VDg=;
	b=c6DUkI9azNE/BSztX4ucIoIRhZdobuvTlrvy6OfFBsVebp3AldY+OvZed7d1s1KeMgPKvW
	C5Ex+F6oFhtmwihR86RWg6Uar9YkyqSjDkZfLanEWkXK09xon3vLVG+9Iib1M+wYyfMPVx
	TB6ZgG0+ImF3SDJM/qb51/5TXtks7uo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-jnGlrlF9OfCNUw1iXBLx9A-1; Mon, 27 Mar 2023 08:43:47 -0400
X-MC-Unique: jnGlrlF9OfCNUw1iXBLx9A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3F7AA100F907;
	Mon, 27 Mar 2023 12:43:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 24BC6C15BB8;
	Mon, 27 Mar 2023 12:43:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DD1C719465A4;
	Mon, 27 Mar 2023 12:43:44 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D5033194658F for <cluster-devel@listman.corp.redhat.com>;
 Mon, 27 Mar 2023 12:43:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A0A2643FBD; Mon, 27 Mar 2023 12:43:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 989893542A
 for <cluster-devel@redhat.com>; Mon, 27 Mar 2023 12:43:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 706423C10228
 for <cluster-devel@redhat.com>; Mon, 27 Mar 2023 12:43:43 +0000 (UTC)
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-301-yKDHdiq_MWW_Q92ext-j5w-1; Mon, 27 Mar 2023 08:43:42 -0400
X-MC-Unique: yKDHdiq_MWW_Q92ext-j5w-1
Received: by mail-pl1-f197.google.com with SMTP id
 p9-20020a170902e74900b001a1c7b2e7afso5716232plf.0
 for <cluster-devel@redhat.com>; Mon, 27 Mar 2023 05:43:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679921021;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qSG7y+Ntsb0V0Se35GjDSzQJ3PXnyxnyggzDwT26VDg=;
 b=gi6gWKwHBBFKucn7JSXKtaVO/QypbWTE2H5W+GyZcJCAhBB4ucmviMko3WZoVTbWmv
 2Ii8X/9FYhBIWq7Ub8fBOBFIqA2fxH/AEu10xTzKe4M0N+VcNofMYmrHfmIU1lZ+pvZf
 aQOGa6ySMrm46VHrr8nawD9O7+5OdJ+AHlIvrSsdvVHuPiXxu4yWrKVdscfTvIR/sfmO
 1gcwCP8CTr2Ioge51XVpGdJOy1oobH/KJB8sqdnN5gtVndSg36kkQNkJG+zPryP4ELIt
 4A45NzfRowQiBVjO8jR47xDZ0zlfaO8+2eKVwhkPtGlh77vdWPF+32uHUnCcu6L1OY+K
 rfdQ==
X-Gm-Message-State: AAQBX9c6vJSmOWaeXbLk+Daom2+Ai7HqAEnh0PK0psFhqHrNGRk/NIgG
 M6EobY+oMDjZVc2qyXKJBI3FQv7eAhhoqmR20B+2EK4pntgLjhyLnUBFLm47E2W1ZhhwQZ9xwc3
 ah7xbbetRRpV7HSgdbeaizn+PjP1Tp9j2ZcSnjQ==
X-Received: by 2002:a17:90a:4a85:b0:240:2ae6:5eb8 with SMTP id
 f5-20020a17090a4a8500b002402ae65eb8mr3464326pjh.9.1679921021075; 
 Mon, 27 Mar 2023 05:43:41 -0700 (PDT)
X-Google-Smtp-Source: AK7set/IhnqRH0avgz+JK08hQhZjv4Jw3/NS2X0K3TbamiHK46SBOKc7O4vHHLLJJ1J7+MraeQNi08nED8rdPtviqto=
X-Received: by 2002:a17:90a:4a85:b0:240:2ae6:5eb8 with SMTP id
 f5-20020a17090a4a8500b002402ae65eb8mr3464320pjh.9.1679921020707; Mon, 27 Mar
 2023 05:43:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230314131829.18515-1-anprice@redhat.com>
In-Reply-To: <20230314131829.18515-1-anprice@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 27 Mar 2023 14:43:29 +0200
Message-ID: <CAHc6FU49Lpqcay-jJJhpf6WNFh6TdMraAeNeWEkj6CE=-tOecQ@mail.gmail.com>
To: Andrew Price <anprice@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [Cluster-devel] [PATCH 0/3] gfs2_(un)link cleanups
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
Cc: cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 14, 2023 at 2:18=E2=80=AFPM Andrew Price <anprice@redhat.com> w=
rote:
> Some trivial cleanups from my O_TMPFILE branch. That work isn't ready
> yet but there was no reason not to send these patches.

Applied, thanks.

Andreas

