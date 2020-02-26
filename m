Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 9F72A1705C7
	for <lists+cluster-devel@lfdr.de>; Wed, 26 Feb 2020 18:13:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582737229;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=mg3n04aLS3/0aW0eyWChE9vpAgeCbiunpfGU7AghRnM=;
	b=KpKGi2VnFduKoM2tw61fARTGL8mx48mE572wy+XxlJcI0VMHbzj9Mz8cOjI3DtFMqVpe1g
	VRVg80xlfQuka34g+tvefd1LoIXIX/3ecbxVPPvct1HEI6ueL5CDESWOLLPN+t3xQyrwVP
	LQ3H8vCCcGKjZhndKdfP1CcIeCOKqr8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-TUUmRhZ8PVme9QXpkn84NA-1; Wed, 26 Feb 2020 12:13:45 -0500
X-MC-Unique: TUUmRhZ8PVme9QXpkn84NA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22118800D55;
	Wed, 26 Feb 2020 17:13:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0307092988;
	Wed, 26 Feb 2020 17:13:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9F5A218089CD;
	Wed, 26 Feb 2020 17:13:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01QHDeYR022002 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 26 Feb 2020 12:13:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A97E82028CD4; Wed, 26 Feb 2020 17:13:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A443F2028CD2
	for <cluster-devel@redhat.com>; Wed, 26 Feb 2020 17:13:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 732108007C9
	for <cluster-devel@redhat.com>; Wed, 26 Feb 2020 17:13:38 +0000 (UTC)
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
	[216.228.121.143]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-337-5l2KxtIINo264PX9uW0umg-1; Wed, 26 Feb 2020 12:13:35 -0500
X-MC-Unique: 5l2KxtIINo264PX9uW0umg-1
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
	hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
	id <B5e56a6ef0000>; Wed, 26 Feb 2020 09:12:16 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
	by hqpgpgate101.nvidia.com (PGP Universal service);
	Wed, 26 Feb 2020 09:13:34 -0800
X-PGP-Universal: processed;
	by hqpgpgate101.nvidia.com on Wed, 26 Feb 2020 09:13:34 -0800
Received: from [172.16.126.1] (10.124.1.5) by HQMAIL107.nvidia.com
	(172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Wed, 26 Feb 2020 17:13:32 +0000
From: Zi Yan <ziy@nvidia.com>
To: Matthew Wilcox <willy@infradead.org>
Date: Wed, 26 Feb 2020 12:13:30 -0500
Message-ID: <0681AC00-BFA7-4C1B-9E92-6B36FA906924@nvidia.com>
In-Reply-To: <20200225214838.30017-8-willy@infradead.org>
References: <20200225214838.30017-1-willy@infradead.org>
	<20200225214838.30017-8-willy@infradead.org>
MIME-Version: 1.0
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
	HQMAIL107.nvidia.com (172.20.187.13)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v8 07/25] mm: Rename various 'offset'
 parameters to 'index'
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
Content-Type: multipart/signed;
	boundary="=_MailMate_07A99A6D-503B-4120-84DB-898871E175DC_=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=_MailMate_07A99A6D-503B-4120-84DB-898871E175DC_=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 25 Feb 2020, at 16:48, Matthew Wilcox wrote:

> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
>
> The word 'offset' is used ambiguously to mean 'byte offset within
> a page', 'byte offset from the start of the file' and 'page offset
> from the start of the file'.  Use 'index' to mean 'page offset
> from the start of the file' throughout the readahead code.
>
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>

Looks good to me.

Reviewed-by: Zi Yan <ziy@nvidia.com>

=E2=80=94
Best Regards,
Yan Zi

--=_MailMate_07A99A6D-503B-4120-84DB-898871E175DC_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJDBAEBCgAtFiEEh7yFAW3gwjwQ4C9anbJR82th+ooFAl5WpzoPHHppeUBudmlk
aWEuY29tAAoJEJ2yUfNrYfqKV10P/3wdODr0Q7tZ/M8jMum6zEQU0MY220Wz5wz6
/mYps3gNEW6eEhbFsQpnK4823yVMDfBih1WwZLdS/6HbJlXHjhTfcLtEFLdkxyPJ
DuWVLGx0uTRwFpUI9Lafd/SpIKAYfnyNi82WlR85zfoFbD4aQSkH19hRScGERL0B
sig3qcFbjLk9Ej7AbviIflLo7gvPaui2EgVjubLfWgUW66U0X7vnCu355fRnlkmK
3Fa9Ipx8EoTp6CG4PWteDdp8lP8CvdJwZKfluaHj/NJjOqxpL/SUTuF9FXtr8nov
l6pElk5cSwy4T4gvyhfmUIYSptxeU+KJSx3hA687R53i9gCQqLepFRwbhe03M87h
2p63F1KGiqm4uzJSDTiKyRLBJOrpDQRjpZSSQ2XBQUOHd2tDHSN5l/2ADupYaF2Y
zXvGbPgzVdHRVY0Ijsu6DqPk0aJfbvtOPZHWfZ9FEVoSj+viLH/AB/8l7OEEGS9M
3h1dW2ghyuDEZfbTB6ow7XVEd2d1B8xxiGTlg13HU2KSuJQlkVGbEZV2Zw9Z/bQx
sYt9io5U0tZ2Q4M8pBiuHeEK3LbKSdXf0kHj0Ovnxg+njzZlZgCfnn2mJOPSdBqs
YksF5IfUgMM+j9I94cj8dJJIz1HyLGox6fq4DxluYIIBkOcVFfinqTqRjgr/AxX+
P6tLcgNH
=g1cC
-----END PGP SIGNATURE-----

--=_MailMate_07A99A6D-503B-4120-84DB-898871E175DC_=--

